import {Component, OnInit, ViewChild} from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import {MatSort} from '@angular/material/sort';
import {ComputersService} from 'src/app/services/computers/computers.service';
import {IComputerComponentNameDto, IPart} from 'src/app/models/computer.interfaces';
import {DestroyBaseComponent} from 'src/app/helpers/components/destroy-base.component';
import {switchMap, takeUntil, tap} from 'rxjs/operators';
import {ActivatedRoute} from '@angular/router';
import {forkJoin, iif, of} from 'rxjs';
import {ComputerMapper} from 'src/app/helpers/mappers/computer.mapper';

@Component({
  selector: 'app-build',
  templateUrl: './build.component.html',
  styleUrls: ['./build.component.scss']
})
export class BuildComponent extends DestroyBaseComponent implements OnInit {
  private computerId: number;

  public computerComponentNames: IComputerComponentNameDto[];
  public totalPrice: number;

  public displayedColumns = ['part', 'selectedPart', 'price', 'actions'];
  public dataSource: MatTableDataSource<IPart>;


  @ViewChild(MatSort, {static: true}) public sort: MatSort;

  constructor(
    private computerService: ComputersService,
    private route: ActivatedRoute) {
    super();
  }

  public ngOnInit(): void {
    this.route.paramMap
      .pipe(
        tap(params => this.computerId = Number.parseInt(params.get('id'))),
        switchMap(() => forkJoin([
          this.computerService.getComputerComponentNames(),
          iif(
            () => !isNaN(this.computerId),
            this.computerService.getComputer(this.computerId),
            of(null)),
        ])),
        takeUntil(this.destroyed),
      )
      .subscribe({
        next: ([computerComponentNames, computer]) => {
          this.computerComponentNames = computerComponentNames;
          const components = ComputerMapper.toPartTest(computerComponentNames, computer);

          this.dataSource = new MatTableDataSource(components);
          this.dataSource.sort = this.sort;
          this.totalPrice = this.getTotalPrice();
        }
      });
  }

  public getTotalPrice(): number {
    return this.dataSource?.data ?
      this.dataSource.data
        .map(data => data.price)
        .reduce((acc, value) => acc + value, 0)
      : 0;
  }
}

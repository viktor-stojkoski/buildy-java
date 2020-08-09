import {Component, OnInit, ViewChild} from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import {MatSort} from '@angular/material/sort';
import {ComputersService} from 'src/app/services/computers/computers.service';
import {IComputerComponentNameDto, IPart} from 'src/app/models/computer.interfaces';
import {DestroyBaseComponent} from 'src/app/helpers/components/destroy-base.component';
import {takeUntil} from 'rxjs/operators';

@Component({
  selector: 'app-build',
  templateUrl: './build.component.html',
  styleUrls: ['./build.component.scss']
})
export class BuildComponent extends DestroyBaseComponent implements OnInit {
  public computerComponentNames: IComputerComponentNameDto[];

  public displayedColumns = ['part', 'selectedPart', 'price', 'actions'];
  public dataSource: MatTableDataSource<IPart>;

  @ViewChild(MatSort, {static: true}) public sort: MatSort;

  constructor(private computerService: ComputersService) {
    super();
  }

  public ngOnInit(): void {
    this.computerService
      .getComputerComponentNames()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: result => {
          this.computerComponentNames = result;
          const components = this.computerComponentNames.map(component => createComponent(component.longName));

          this.dataSource = new MatTableDataSource(components);
          this.dataSource.sort = this.sort;
        },
        error: error => console.error(error)
      });
  }

  public applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  public getTotalPrice(): number {
    return this.dataSource?.data ?
      this.dataSource.data
        .map(data => data.price)
        .reduce((acc, value) => acc + value, 0)
      : 0;
  }
}

function createComponent(componentName: string): IPart {

  return {
    part: componentName,
    selectedPart: '',
    price: 0
  };

}

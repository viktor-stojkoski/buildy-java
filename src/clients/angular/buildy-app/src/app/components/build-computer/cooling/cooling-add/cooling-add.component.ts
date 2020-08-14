import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { IPart } from 'src/app/models/computer.interfaces';
import { ComputerComponentName } from 'src/app/models/computer.models';
import { ICoolingDto } from 'src/app/models/cooling.interfaces';
import { CoolingService } from 'src/app/services/cooling/cooling.service';

@Component({
  selector: 'app-cooling-add',
  templateUrl: './cooling-add.component.html',
  styleUrls: ['./cooling-add.component.scss']
})
export class CoolingAddComponent extends DestroyBaseComponent implements OnInit {
  public displayedColumns: string[] = ['image', 'name', 'manufacturer', 'size', 'speed', 'coolingType', 'rgb', 'price', 'actions'];
  public dataSource: MatTableDataSource<ICoolingDto>;
  public coolings: ICoolingDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private coolingService: CoolingService,
    private router: Router
  ) {
    super();
  }

  ngOnInit() {
    this.coolingService
      .getCoolings()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: coolings => {
          this.coolings = coolings;
          this.dataSource = new MatTableDataSource(coolings);
          this.dataSource.paginator = this.paginator;
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

  public addToMyComputer(partUid: string): void {
    const coolings = this.coolings.find(r => r.uid === partUid);

    const part: IPart = {
      part: ComputerComponentName.Cooling.longName,
      selectedPart: coolings.name,
      price: coolings.price
    };
    sessionStorage.setItem(ComputerComponentName.Cooling.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }
}

import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';

import { DestroyBaseComponent } from '../../../../helpers/components/destroy-base.component';
import { IPart } from '../../../../models/computer.interfaces';
import { ComputerComponentName } from '../../../../models/computer.models';
import { ICoolingDto } from '../../../../models/cooling.interfaces';
import { CoolingService } from '../../../../services/cooling/cooling.service';

@Component({
  selector: 'app-cooling-add',
  templateUrl: './cooling-add.component.html',
  styleUrls: ['./cooling-add.component.scss']
})
export class CoolingAddComponent extends DestroyBaseComponent implements OnInit, OnDestroy {
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

  public ngOnInit(): void {
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
    const cooling = this.coolings.find(r => r.uid === partUid);

    const part: IPart = {
      uid: cooling.uid,
      part: ComputerComponentName.Cooling.longName,
      selectedPart: cooling.name,
      price: cooling.price
    };
    sessionStorage.setItem(ComputerComponentName.Cooling.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}

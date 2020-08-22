import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';

import { DestroyBaseComponent } from '../../../../helpers/components/destroy-base.component';
import { IPart } from '../../../../models/computer.interfaces';
import { ComputerComponentName } from '../../../../models/computer.models';
import { IMotherboardDto } from '../../../../models/motherboard.interfaces';
import { MotherboardService } from '../../../../services/motherboard/motherboard.service';

@Component({
  selector: 'app-motherboard-add',
  templateUrl: './motherboard-add.component.html',
  styleUrls: ['./motherboard-add.component.scss']
})
export class MotherboardAddComponent extends DestroyBaseComponent implements OnInit, OnDestroy {
  public displayedColumns = ['image', 'name', 'manufacturer', 'motherboardType', 'socket', 'memorySupported', 'dimmSlots', 'price', 'actions'];
  public dataSource: MatTableDataSource<IMotherboardDto>;
  public motherboards: IMotherboardDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private motherboardService: MotherboardService,
    private router: Router
  ) {
    super();
  }

  public ngOnInit(): void {
    this.motherboardService
      .getMotherboards()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: motherboards => {
          this.motherboards = motherboards;
          this.dataSource = new MatTableDataSource(motherboards);
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
    const motherboard = this.motherboards.find(r => r.uid === partUid);

    const part: IPart = {
      uid: motherboard.uid,
      part: ComputerComponentName.Motherboard.longName,
      selectedPart: motherboard.name,
      price: motherboard.price
    };
    sessionStorage.setItem(ComputerComponentName.Motherboard.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}

import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { IPart } from 'src/app/models/computer.interfaces';
import { ComputerComponentName } from 'src/app/models/computer.models';
import { IPsuDto } from 'src/app/models/psu.interfaces';
import { PsuService } from 'src/app/services/psu/psu.service';

@Component({
  selector: 'app-psu-add',
  templateUrl: './psu-add.component.html',
  styleUrls: ['./psu-add.component.scss']
})
export class PsuAddComponent extends DestroyBaseComponent implements OnInit {
  public displayedColumns: string[] = ['image', 'name', 'manufacturer', 'psuEfficiency', 'capacity', 'modularity', 'price', 'actions'];
  public dataSource: MatTableDataSource<IPsuDto>;
  public psus: IPsuDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private psuService: PsuService,
    private router: Router
  ) {
    super();
  }

  ngOnInit() {
    this.psuService
      .getPsus()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: psus => {
          this.psus = psus;
          this.dataSource = new MatTableDataSource(psus);
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
    const psu = this.psus.find(r => r.uid === partUid);

    const part: IPart = {
      part: ComputerComponentName.PSU.longName,
      selectedPart: psu.name,
      price: psu.price
    };
    sessionStorage.setItem(ComputerComponentName.PSU.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }
}

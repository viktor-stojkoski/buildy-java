import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { ICaseDto } from 'src/app/models/case.interfaces';
import { IPart } from 'src/app/models/computer.interfaces';
import { ComputerComponentName } from 'src/app/models/computer.models';
import { CaseService } from 'src/app/services/case/case.service';

@Component({
  selector: 'app-case-add',
  templateUrl: './case-add.component.html',
  styleUrls: ['./case-add.component.scss']
})
export class CaseAddComponent extends DestroyBaseComponent implements OnInit {
  public displayedColumns = ['image', 'name', 'manufacturer', 'dimensions', 'fansSupported', 'motherboardType', 'price', 'actions'];
  public dataSource: MatTableDataSource<ICaseDto>;
  public cases: ICaseDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private caseService: CaseService,
    private router: Router
  ) {
    super();
  }

  ngOnInit() {
    this.caseService
      .getCases()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: cases => {
          this.cases = cases;
          this.dataSource = new MatTableDataSource(cases);
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
    const pcCase = this.cases.find(r => r.uid === partUid);

    const part: IPart = {
      part: ComputerComponentName.Case.longName,
      selectedPart: pcCase.name,
      price: pcCase.price
    };
    sessionStorage.setItem(ComputerComponentName.Case.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }
}

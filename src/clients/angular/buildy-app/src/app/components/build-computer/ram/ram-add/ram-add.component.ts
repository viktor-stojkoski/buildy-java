import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { takeUntil } from 'rxjs/operators';
import { Router } from '@angular/router';
import { ComputerComponentName } from 'src/app/models/computer.models';
import { IRamDto } from 'src/app/models/ram.interfaces';
import { RamService } from 'src/app/services/ram/ram.service';

@Component({
  selector: 'app-cpu-add',
  templateUrl: './ram-add.component.html',
  styleUrls: ['./ram-add.component.scss']
})
export class RamAddComponent extends DestroyBaseComponent implements OnInit {
  public displayedColumns: string[] = ['image', 'name', 'manufacturer', 'ramMemoryType', 'size', 'timing', 'frequency', 'price', 'actions'];
  public dataSource: MatTableDataSource<IRamDto>;
  public ramMemories: IRamDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private ramService: RamService,
    private router: Router
  ) {
    super();
  }

  ngOnInit() {
    this.ramService
      .getRamMemories()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: ramMemories => {
          this.ramMemories = ramMemories;
          this.dataSource = new MatTableDataSource(ramMemories);
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
    const ram = this.ramMemories.find(r => r.uid === partUid);

    const part: IPart = {
      part: ComputerComponentName.RAM.longName,
      selectedPart: ram.name,
      price: ram.price
    };
    sessionStorage.setItem(ComputerComponentName.RAM.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }
}

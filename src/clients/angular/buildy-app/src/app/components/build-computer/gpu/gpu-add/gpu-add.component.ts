import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';

import { DestroyBaseComponent } from '../../../../helpers/components/destroy-base.component';
import { IPart } from '../../../../models/computer.interfaces';
import { ComputerComponentName } from '../../../../models/computer.models';
import { IGpuDto } from '../../../../models/gpu.interfaces';
import { GpuService } from '../../../../services/gpu/gpu.service';

@Component({
  selector: 'app-gpu-add',
  templateUrl: './gpu-add.component.html',
  styleUrls: ['./gpu-add.component.scss']
})
export class GpuAddComponent extends DestroyBaseComponent implements OnInit, OnDestroy {
  public displayedColumns: string[] = ['image', 'name', 'manufacturer', 'gpuMemoryType', 'ramSize', 'timing', 'frequency', 'memoryClock', 'price', 'actions'];
  public dataSource: MatTableDataSource<IGpuDto>;
  public gpus: IGpuDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private gpuService: GpuService,
    private router: Router
  ) {
    super();
  }

  public ngOnInit(): void {
    this.gpuService
      .getGpus()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: gpus => {
          this.gpus = gpus;
          this.dataSource = new MatTableDataSource(gpus);
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
    const gpu = this.gpus.find(g => g.uid === partUid);

    const part: IPart = {
      uid: gpu.uid,
      part: ComputerComponentName.GPU.longName,
      selectedPart: gpu.name,
      price: gpu.price
    };
    sessionStorage.setItem(ComputerComponentName.GPU.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}

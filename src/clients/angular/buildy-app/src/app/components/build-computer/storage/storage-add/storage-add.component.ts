import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { IPart } from 'src/app/models/computer.interfaces';
import { ComputerComponentName } from 'src/app/models/computer.models';
import { IStorageDto } from 'src/app/models/storage.interfaces';
import { StorageService } from 'src/app/services/storage/storage.service';

@Component({
  selector: 'app-storage-add',
  templateUrl: './storage-add.component.html',
  styleUrls: ['./storage-add.component.scss']
})
export class StorageAddComponent extends DestroyBaseComponent implements OnInit {
  public displayedColumns: string[] = ['image', 'name', 'manufacturer', 'storageType', 'capacity', 'readingSpeed', 'writingSpeed', 'price', 'actions'];
  public dataSource: MatTableDataSource<IStorageDto>;
  public storages: IStorageDto[];

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  constructor(
    private storageService: StorageService,
    private router: Router
  ) {
    super();
  }

  ngOnInit() {
    this.storageService
      .getStorages()
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: storages => {
          this.storages = storages;
          this.dataSource = new MatTableDataSource(storages);
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
    const storage = this.storages.find(r => r.uid === partUid);

    const part: IPart = {
      uid: storage.uid,
      part: ComputerComponentName.Storage.longName,
      selectedPart: storage .name,
      price: storage .price
    };
    sessionStorage.setItem(ComputerComponentName.Storage.shortName, JSON.stringify(part));

    this.router.navigate(['build']);
  }
}

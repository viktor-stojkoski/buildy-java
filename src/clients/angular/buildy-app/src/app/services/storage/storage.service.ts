import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IStorageDto } from 'src/app/models/storage.interfaces';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class StorageService {

  private storagesApiRoute = 'storages';

  constructor(private baseApiService: BaseApiService) { }

  public getStorages(): Observable<IStorageDto[]> {
    return this.baseApiService.get<IStorageDto[]>(`${this.storagesApiRoute}`);
  }
}

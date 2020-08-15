import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ICoolingDto } from 'src/app/models/cooling.interfaces';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class CoolingService {

  private coolingsApiRoute = 'coolings';

  constructor(private baseApiService: BaseApiService) { }

  public getCoolings(): Observable<ICoolingDto[]> {
    return this.baseApiService.get<ICoolingDto[]>(`${this.coolingsApiRoute}`);
  }
}

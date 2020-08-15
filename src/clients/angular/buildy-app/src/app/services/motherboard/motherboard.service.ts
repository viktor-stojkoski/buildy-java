import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IMotherboardDto } from 'src/app/models/motherboard.interfaces';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class MotherboardService {

  private motherboardsApiRoute = 'motherboards';

  constructor(private baseApiService: BaseApiService) { }

  public getMotherboards(): Observable<IMotherboardDto[]> {
    return this.baseApiService.get<IMotherboardDto[]>(`${this.motherboardsApiRoute}`);
  }
}

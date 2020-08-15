import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IPsuDto } from 'src/app/models/psu.interfaces';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class PsuService {

  private psusApiRoute = 'psus';

  constructor(private baseApiService: BaseApiService) { }

  public getPsus(): Observable<IPsuDto[]> {
    return this.baseApiService.get<IPsuDto[]>(`${this.psusApiRoute}`);
  }
}

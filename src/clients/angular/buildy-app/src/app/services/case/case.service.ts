import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ICaseDto } from 'src/app/models/case.interfaces';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class CaseService {

  private casesApiRoute = 'cases';

  constructor(private baseApiService: BaseApiService) { }

  public getCases(): Observable<ICaseDto[]> {
    return this.baseApiService.get<ICaseDto[]>(`${this.casesApiRoute}`);
  }
}

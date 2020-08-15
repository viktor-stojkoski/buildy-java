import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IRamDto } from 'src/app/models/ram.interfaces';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class RamService {

  private ramsApiRoute = 'rams';

  constructor(private baseApiService: BaseApiService) { }

  public getRamMemories(): Observable<IRamDto[]> {
    return this.baseApiService.get<IRamDto[]>(`${this.ramsApiRoute}`);
  }
}

import { Injectable } from '@angular/core';
import { BaseApiService } from '../base/base-api.service';
import { Observable } from 'rxjs';
import { IGpuDto } from 'src/app/models/gpu.interfaces';

@Injectable({
  providedIn: 'root'
})
export class GpuService {

  private gpusApiRoute = 'gpus';

  constructor(private baseApiService: BaseApiService) { }

  public getGpus(): Observable<IGpuDto[]> {
    return this.baseApiService.get<IGpuDto[]>(`${this.gpusApiRoute}`);
  }
}

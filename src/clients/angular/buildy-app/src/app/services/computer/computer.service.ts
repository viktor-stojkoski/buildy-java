import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { IComputerComponentNameDto, IComputerDto } from 'src/app/models/computer.interfaces';

import { BaseApiService } from '../base/base-api.service';
import { IUserDto } from 'src/app/models/user.interfaces';
import { SaveComputerRequest } from 'src/app/models/requests/computer.requests';

@Injectable({
  providedIn: 'root'
})
export class ComputerService {

  private computersApiRoute = 'computers';

  constructor(private baseApiService: BaseApiService) { }

  public getComputerComponentNames(): Observable<IComputerComponentNameDto[]> {
    return this.baseApiService.get<IComputerComponentNameDto[]>(`${this.computersApiRoute}/component-names`);
  }

  public getOursComputer(id: number): Observable<IComputerDto> {
    return this.baseApiService.get<IComputerDto>(`${this.computersApiRoute}/ours/${id}`);
  }

  public saveComputer(saveComputerRequest: SaveComputerRequest): Observable<IComputerDto> {
    return this.baseApiService.post<IComputerDto>(`${this.computersApiRoute}`, saveComputerRequest);
  }
}

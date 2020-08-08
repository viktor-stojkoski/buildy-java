import {Injectable} from '@angular/core';
import {BaseApiService} from '../base/base-api.service';
import {Observable} from 'rxjs';
import {IComputerComponentNameDto} from 'src/app/models/computer.interfaces';

@Injectable({
  providedIn: 'root'
})
export class ComputersService {

  constructor(private baseApiService: BaseApiService) { }

  public getComputerComponentNames(): Observable<IComputerComponentNameDto[]> {
    return this.baseApiService.get<IComputerComponentNameDto[]>('computers/component-names');
  }
}

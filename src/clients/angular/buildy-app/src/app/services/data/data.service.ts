import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { IPart } from 'src/app/models/computer.interfaces';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  private cpu = new BehaviorSubject<IPart>(null);
  public cpuObservable = this.cpu.asObservable();

  public combinedComponents = new BehaviorSubject(undefined);
  public combinedObservable = this.combinedComponents.asObservable();

  constructor() { }

  public changeCpu(cpu: IPart): void {
    this.combinedComponents.next(cpu);
    // this.cpu.complete();
  }
}

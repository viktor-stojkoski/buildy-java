import {OnDestroy} from '@angular/core';
import {Subject} from 'rxjs';

export abstract class DestroyBaseComponent implements OnDestroy {
  protected destroyed: Subject<void> = new Subject<void>();

  constructor() {}

  ngOnDestroy(): void {
    this.destroyed.next();
    this.destroyed.complete();
  }
}

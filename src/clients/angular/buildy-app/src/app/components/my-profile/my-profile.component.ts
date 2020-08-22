import { Component, OnDestroy, OnInit } from '@angular/core';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { IComputerDto } from 'src/app/models/computer.interfaces';
import { IUserDto } from 'src/app/models/user.interfaces';
import { AuthService } from 'src/app/services/auth/auth.service';
import { ComputerService } from 'src/app/services/computer/computer.service';

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.component.html',
  styleUrls: ['./my-profile.component.scss']
})
export class MyProfileComponent extends DestroyBaseComponent implements OnInit, OnDestroy {

  public computers: IComputerDto[];
  public currentUser: IUserDto;

  constructor(
    private computerService: ComputerService,
    private authService: AuthService) {
      super();
    }

  public ngOnInit(): void {
    this.currentUser = this.authService.getCurrentUser();

    this.computerService
      .getComputersForUser(this.currentUser.uid)
      .pipe(takeUntil(this.destroyed))
      .subscribe({
        next: result => {
          console.log(result);
          this.computers = result;
        },
        error: error => console.error(error)
      });
  }

  public deletePc(pcUid: string): void {
    // this.computerService
    //   .deletePc(this.currentUser.uid, pcUid)
    //   .subscribe({
    //     next: () => {},
    //     error: error => console.error(error)
    //   });
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}

import { Component, OnInit } from '@angular/core';
import { IComputerDto } from 'src/app/models/computer.interfaces';
import { ComputerService } from 'src/app/services/computer/computer.service';
import { AuthService } from 'src/app/services/auth/auth.service';
import { IUserDto } from 'src/app/models/user.interfaces';

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.component.html',
  styleUrls: ['./my-profile.component.scss']
})
export class MyProfileComponent implements OnInit {

  public computers: IComputerDto[];
  public currentUser: IUserDto;

  constructor(
    private computerService: ComputerService,
    private authService: AuthService) { }

  public ngOnInit(): void {
    this.currentUser = this.authService.getCurrentUser();

    this.computerService
      .getComputersForUser(this.currentUser.uid)
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

}

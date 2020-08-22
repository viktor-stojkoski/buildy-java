import { Component, OnInit } from '@angular/core';
import { IUserDto } from 'src/app/models/user.interfaces';
import { AuthService } from 'src/app/services/auth/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {

  public isAuthenticated: boolean;
  public currentUser: IUserDto;

  constructor(private authService: AuthService) { }

  public ngOnInit(): void {
    this.authService
    .loginStatusChanged()
    .subscribe({
      next: result => {
        this.isAuthenticated = result;
        if (this.isAuthenticated) {
          this.currentUser = this.authService.getCurrentUser();
        }
      },
      error: error => console.error(error)
    });
  }

  public logout(): void {
    this.authService.logout();
  }

}

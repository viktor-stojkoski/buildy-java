import { Component, OnInit, OnChanges } from '@angular/core';
import { AuthService } from 'src/app/services/auth/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {

  public isAuthenticated: boolean;

  constructor(private authService: AuthService) { }

  public ngOnInit(): void {
    this.authService
    .loginStatusChanged()
    .subscribe({
      next: result => {
        this.isAuthenticated = result;
      }
    });
  }

  public logout(): void {
    this.authService.logout();
  }

}

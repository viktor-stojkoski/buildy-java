import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {

  public isAuthenticated: boolean;

  constructor(private authService: AuthService) { }

  public ngOnInit(): void {
    this.isAuthenticated = this.authService.isAuthenticated();
  }

  public logout(): void {
    this.authService.logout();
  }

}

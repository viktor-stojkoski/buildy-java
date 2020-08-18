import { HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, of, BehaviorSubject, Subject, ReplaySubject } from 'rxjs';
import { map } from 'rxjs/operators';
import { LoginRequest, RegisterRequest } from 'src/app/models/requests/user.requests';

import { BaseApiService } from '../base/base-api.service';
import { IRoleDto, IUserDto } from 'src/app/models/user.interfaces';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private isAuthenticatedSubject = new ReplaySubject<boolean>();
  private authRoute = 'auth';
  private CURRENT_USER = 'CURRENT_USER';
  private TOKEN = 'TOKEN';

  constructor(
    private router: Router,
    private baseApiService: BaseApiService
  ) { }

  public login(loginRequest: LoginRequest): Observable<IUserDto> {
    const headers = new HttpHeaders({
      Authorization: this.createBasicAuthToken(loginRequest),
      'Content-Type': 'application/json',
      Accept: 'application/json'
    });
    return this.baseApiService.post<IUserDto>(`${this.authRoute}/login`, loginRequest, headers)
      .pipe(
        map(user => {
          const token = window.btoa(loginRequest.username + ':' + loginRequest.password);
          sessionStorage.setItem(this.CURRENT_USER, JSON.stringify(user));
          sessionStorage.setItem(this.TOKEN, JSON.stringify(token));
          this.isAuthenticatedSubject.next(true);
          return user;
        }
      ));
  }

  public register(registerRequest: RegisterRequest): Observable<IUserDto> {
    return this.baseApiService.post<IUserDto>(`${this.authRoute}/register`, registerRequest);
  }

  public logout(): void {
    sessionStorage.removeItem(this.CURRENT_USER);
    sessionStorage.removeItem(this.TOKEN);
    this.isAuthenticatedSubject.next(false);
    this.router.navigate(['login']);
  }

  public loginStatusChanged(): Observable<boolean> {
    this.isAuthenticatedSubject.next(this.isAuthenticated());
    return this.isAuthenticatedSubject.asObservable();
  }

  public isAuthenticated(): boolean {
    const user = sessionStorage.getItem(this.TOKEN);

    if (user === null || user === undefined) {
      return false;
    }

    return true;
  }

  public getCurrentUserToken(): string {
    const user = JSON.parse(sessionStorage.getItem(this.TOKEN));

    return `Basic ${user}`;
  }

  private createBasicAuthToken(userRequest: LoginRequest): string {
    const authToken = `Basic ${btoa(`${userRequest.username}:${userRequest.password}`)}`;

    return authToken;
  }
}

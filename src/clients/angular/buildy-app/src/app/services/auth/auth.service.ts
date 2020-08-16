import { HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, of, BehaviorSubject, Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { UserRequest } from 'src/app/models/requests/user.requests';

import { BaseApiService } from '../base/base-api.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private isAuthenticatedSubject = new Subject<boolean>();
  private authRoute = 'auth';
  private CURRENT_USER = 'CURRENT_USER';

  constructor(
    private router: Router,
    private baseApiService: BaseApiService
  ) { }

  public login(userRequest: UserRequest): Observable<any> {
    const headers = new HttpHeaders({
      Authorization: this.createBasicAuthToken(userRequest),
      'Content-Type': 'application/json',
      Accept: 'application/json'
    });
    return this.baseApiService.post<UserRequest>(`${this.authRoute}/login`, userRequest, headers)
      .pipe(
        map(user => {
          const currentUser = window.btoa(userRequest.username + ':' + userRequest.password);
          sessionStorage.setItem(this.CURRENT_USER, JSON.stringify(currentUser));
          this.isAuthenticatedSubject.next(true);
          return user;
        }
      ));
  }

  public logout(): void {
    sessionStorage.removeItem(this.CURRENT_USER);
    this.isAuthenticatedSubject.next(false);
    this.router.navigate(['login']);
  }

  public loginStatusChanged(): Observable<boolean> {
    return this.isAuthenticatedSubject.asObservable();
  }

  public isAuthenticated(): boolean {
    const user = sessionStorage.getItem(this.CURRENT_USER);

    if (user === null || user === undefined) {
      return false;
    }

    return true;
  }

  public getCurrentUserToken(): string {
    const user = JSON.parse(sessionStorage.getItem(this.CURRENT_USER));

    return `Basic ${user}`;
  }

  private createBasicAuthToken(userRequest: UserRequest): string {
    const authToken = `Basic ${btoa(`${userRequest.username}:${userRequest.password}`)}`;

    return authToken;
  }
}

import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BaseApiService } from '../base/base-api.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { HttpHeaders } from '@angular/common/http';
import { UserRequest } from 'src/app/models/requests/user.requests';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private authRoute = 'auth';
  private CURRENT_USER = 'CURRENT_USER';

  public authToken: string;

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

          return user;
        }
      ));
  }

  public logout(): void {
    localStorage.removeItem(this.CURRENT_USER);
    this.router.navigate(['login']);
  }

  public isAuthenticated(): boolean {
    const user = sessionStorage.getItem(this.CURRENT_USER);

    if (user === null || user === undefined) {
      return false;
    }

    return true;
  }

  public createBasicAuthToken(userRequest: UserRequest): string {
    const authToken = `Basic ${btoa(`${userRequest.username}:${userRequest.password}`)}`;
    this.authToken = authToken;

    return authToken;
  }
}

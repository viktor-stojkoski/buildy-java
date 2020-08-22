import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthInterceptorService implements HttpInterceptor {

  constructor(private authService: AuthService) { }

  public intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (this.authService.isAuthenticated() && req.url.indexOf('auth') === -1) {
      const token = this.authService.getCurrentUserToken();
      const authRequest = req.clone({
        setHeaders: {
          'Content-Type': 'application/json',
          Authorization: token,
          Accept: 'application/json'
        }
      });

      return next.handle(authRequest);
    } else {
      return next.handle(req);
    }
  }

}

import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthInterceptorService implements HttpInterceptor {

  constructor(private authService: AuthService) { }

  public intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (this.authService.isAuthenticated() && req.url.indexOf('auth') === -1) {
      // const authRequest = req.clone({
      //   headers: new HttpHeaders ({
      //     'Content-Type': 'application/json',
      //     Authorization: this.authService.authToken,
      //     // Accept: 'application/json'
      //   })
      // });
      const authRequest = req.clone({
        setHeaders: {
          Authorization: this.authService.authToken
        }
      });
      // const headers = new Headers();
      // headers.set('Authorization', this.authService.authToken);
      // const authRequest = req.clone();
      // const header = 'Authorization';
      // const token = this.authService.authToken;
      // authRequest.headers.append(header, token);
      return next.handle(authRequest);
    } else {
      return next.handle(req);
    }
  }

}

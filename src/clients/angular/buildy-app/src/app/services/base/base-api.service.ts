import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment  } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class BaseApiService {

  public httpHeaders: HttpHeaders = new HttpHeaders({
    // 'Content-Type': 'application/json',
    Accept: 'application/json'
  });

  constructor(private http: HttpClient) { }

  public get<T>(url: string, params: HttpParams = new HttpParams()): Observable<T> {
    return this.http.get<T>(`${environment.baseApiUrl}${url}`, { headers: this.httpHeaders, params });
  }

  public post<T>(url: string, data: object = { }, httpHeaders?: HttpHeaders): Observable<T> {
    return this.http.post<T>
      (`${environment.baseApiUrl}${url}`,
        JSON.stringify(data),
        { headers: httpHeaders ? httpHeaders : this.httpHeaders });
  }

  public put<T>(url: string, data: object = { }): Observable<T> {
    return this.http.put<T>(`${environment.baseApiUrl}${url}`, JSON.stringify(data), { headers: this.httpHeaders });
  }

  public delete<T>(url: string): Observable<T> {
    return this.http.delete<T>(`${environment.baseApiUrl}${url}`, { headers: this.httpHeaders });
  }

  public patch<T>(url: string, data: object = { }): Observable<T> {
    return this.http.patch<T>(`${environment.baseApiUrl}${url}`, JSON.stringify(data), { headers: this.httpHeaders});
  }
}

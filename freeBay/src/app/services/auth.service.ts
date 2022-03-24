import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError, map, Observable, of, shareReplay, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  constructor(private http: HttpClient) { }
  
  public login(user:any): Observable<any> {
    return this.http.post("http://localhost:8000/login", user);
  }

  public logout(token:any): Observable<any> {
    return this.http.get("http://localhost:8000/logout", token);
  }

}




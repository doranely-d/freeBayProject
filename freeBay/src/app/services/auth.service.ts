import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError, map, Observable, of, shareReplay, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  constructor(private http: HttpClient) { }
  
  public login(username:any, password:any): Observable<any> {

    let apiURL = `http://localhost:8000/login?username=${username}&password=${password}`;
    return this.http.post(apiURL,'');
  }

  public logout(token:any): Observable<any> {
    return this.http.get("http://localhost:8000/logout?token="+ token);
  }

  public register(username:any,password:any,email:any): Observable<any> {
    let apiURL = `http://127.0.0.1:8000/user`;
    return this.http.post(apiURL,'');
  }
}




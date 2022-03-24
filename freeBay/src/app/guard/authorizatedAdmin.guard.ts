import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthorizatedGuard implements CanActivate {
  
  constructor(private router: Router) { }

  canActivate() {

    if (localStorage.getItem("dataAdmin")) {
      return true;
    }

    this.router.navigate(['/']);
    return false;
  }
  
}

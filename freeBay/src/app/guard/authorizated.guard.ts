import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthorizatedGuard implements CanActivate {
  usuario:any = []

  constructor(private router: Router) { }

  canActivate() {
   

    if (localStorage.getItem("sesion")) {
      //Validamos que existan los datos de los usuarios
      if (localStorage.getItem("user")) {
        this.usuario = localStorage.getItem("user")
        this.usuario = JSON.parse(this.usuario);

        if(this.usuario['role'].name == 'ROL_VENDEDOR'){
          return true;
        }
      }
    }

    this.router.navigate(['/']);
    return false;
  }
  
}

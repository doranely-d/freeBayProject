import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent implements OnInit {
  public user: any;
  public id: any;
  public sesion = false;
  cart: any= [];

  constructor(private cartService: CartService,private router : Router,private authService: AuthService) { }

  ngOnInit(): void {
    if(localStorage.getItem("sesion")){
      this.user = localStorage.getItem('user') as string;
      this.user = JSON.parse(this.user);
      this.cart = localStorage.getItem('cart') as string;
      this.cart = JSON.parse( this.cart);
      this.id = this.user.id
      this.sesion = true;
    }
  }

  logout() {
    this.authService.logout(localStorage.getItem('token')).subscribe( data => {});
    localStorage.removeItem("user");
    localStorage.removeItem("sesion");
    localStorage.removeItem("token");
    this.router.navigate(['/']);
 }
}

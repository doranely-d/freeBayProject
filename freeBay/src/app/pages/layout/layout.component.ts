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
  public sesion = false;
  cart: any= [];

  constructor(private cartService: CartService,private router : Router,private authService: AuthService) { }

  ngOnInit(): void {
    this.getCartTotal();
    if(localStorage.getItem("sesion")){
      this.sesion = true;
    }
  }
  getCartTotal(): void {
    this.cartService.getCartTotal().subscribe(cart=> this.cart = cart);
	}

  logout() {
    const token = {token: localStorage.getItem('token')};

    this.authService.logout(token).subscribe( data => {
      console.log(data);
    });
    
    localStorage.removeItem("user");
    localStorage.removeItem("sesion");
    localStorage.removeItem("token");
    this.router.navigate(['/']);
}

}

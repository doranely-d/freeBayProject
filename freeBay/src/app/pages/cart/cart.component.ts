import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cart } from 'src/app/models/cart.model';
import { CartItem } from 'src/app/models/cartItem.model';
import { CartService } from 'src/app/services/cart.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  qty  : number = 5;
  cartItems: CartItem[] = [];
  cart: any = [];
  user: any;
  id: any;

  constructor(private cartService: CartService,private router: Router) { }

  ngOnInit(): void {
    this.getCartItems()
    this.cart = localStorage.getItem('cart') as string;
    this.cart = JSON.parse( this.cart);
  }

  getCartItems(): void {
    this.cartService.getCartItems().subscribe(cartItems=> this.cartItems = cartItems);
	}

  addOrder(): void {
    this.cartService.addOrder(this.cart ).subscribe( data => {
      Swal.fire(
        'Listo',
        'Se pago correctamente',
        'success'
      )
      this.cartService.deleteCart(this.cart.id).subscribe();
      this.cartService.putCart(this.cart.id).subscribe();

      this.router.navigate(['/']);
    },
    (err) => {
      console.log(err);
      Swal.fire({
        title: 'Error!',
        text: "No se pago el item",
        icon: 'error',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#39C0ED'
        })
      }
      );
	}

  getCartTotal(): void {
    if(localStorage.getItem("sesion")){
      this.user = localStorage.getItem('user') as string;
      this.user = JSON.parse(this.user);
      this.id = this.user.id
    }
    this.cartService.getCartTotal(this.id).subscribe(cart=> this.cart = cart);
	}

  deleteCartItems(data:any): void {
    var i = this.cartItems.indexOf( data );
    this.cartItems.splice( i, 1 );
    this.cartService.deleteCartItems(data.id).subscribe( data => {
      Swal.fire(
        'Listo',
        'Se elimino correctamente',
        'success'
      )
      localStorage.setItem('cart',  JSON.stringify( this.cart));

      this.router.navigate(['cart']);
    },
    (err) => {
      console.log(err);
      Swal.fire({
        title: 'Error!',
        text: "No se elimina el item",
        icon: 'error',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#39C0ED'
        })
      }
      );
    }

  onMinusClick(data : any) {
    if(data['qty']-1 >= 0){
      data['qty'] = data['qty']-1;
      this.cart['total'] -= data['product']['price'];
      this.cart['total_qty'] -= 1;
      this.cartService.putCartItems(data['id'],data['qty']).subscribe();
      localStorage.setItem('cart',  JSON.stringify( this.cart));
    }
  }
  onPlusClick(data : any) {
    data['qty'] = data['qty']+1;
    this.cart['total'] += data['product']['price'];
    this.cart['total_qty'] += 1;
    this.cartService.putCartItems(data['id'],data['qty']).subscribe();
    localStorage.setItem('cart',  JSON.stringify( this.cart));
  }
}

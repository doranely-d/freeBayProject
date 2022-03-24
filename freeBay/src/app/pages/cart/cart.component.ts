import { Component, OnInit } from '@angular/core';
import { Cart } from 'src/app/models/cart.model';
import { CartItem } from 'src/app/models/cartItem.model';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  qty  : number = 5;
  cartItems: CartItem[] = [];
  cart: any = [];

  constructor(private cartService: CartService) { }

  ngOnInit(): void {
    this.getCartItems()
    this.getCartTotal()
  }

  getCartItems(): void {
    this.cartService.getCartItems().subscribe(cartItems=> this.cartItems = cartItems);
	}

  getCartTotal(): void {
    this.cartService.getCartTotal().subscribe(cart=> this.cart = cart);
	}

  onMinusClick(data : any, index : number, sub_index : number) {

    if(index==9999999999 && sub_index==9999999999){
      console.log(data)
       
    }else{
    }
  }
  onPlusClick(data : any, index : number, sub_index : number) {

    if(index==9999999999 && sub_index==9999999999){
       
    }else{
    }
  }
}

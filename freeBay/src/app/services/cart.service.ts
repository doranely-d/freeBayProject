import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Cart } from '../models/cart.model';
import { CartItem } from '../models/cartItem.model';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  
  constructor(private http: HttpClient) { }
  
  /** GET CartTotal*/
  getCartTotal() {
    return this.http.get('http://127.0.0.1:8000/cartTotal');
  }
  /** GET cartItem*/
  getCartItems(): Observable<CartItem[]> {
    return this.http.get<CartItem[]>('http://127.0.0.1:8000/cartItem');
  }

}
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Cart, Order } from '../models/cart.model';
import { CartItem } from '../models/cartItem.model';
import { AnyCatcher } from 'rxjs/internal/AnyCatcher';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  
  constructor(private http: HttpClient) { }
  
  /** GET CartTotal*/
  getCartTotal(user:any) {
    let apiURL = `http://127.0.0.1:8000/cartTotal?user=${user}`;
    return this.http.get(apiURL);
  }
  /** putCartItems*/
  putCart(id:any) {
    let apiURL = `http://127.0.0.1:8000/cartTotal/?id=${id}&total=0&total_qty=0`;
    return this.http.put(apiURL,'');
  }

  /** GET cartItem*/
  getCartItems(): Observable<CartItem[]> {
    return this.http.get<CartItem[]>('http://127.0.0.1:8000/cartItem');
  }

  /** putCartItems*/
  putCartItems(id:any,qty:any) {
    let apiURL = 'http://127.0.0.1:8000/cartItem/?id='+id+'&qty='+qty;
    return this.http.put(apiURL,'');
  }

  /** deleteCartItems*/
  deleteCartItems(id:any) {
    let apiURL = `http://127.0.0.1:8000/cartItem?id=${id}`;
    return this.http.delete(apiURL);
  }

  /** deleteCart*/
  deleteCart(cart:any) {
    let apiURL = `http://127.0.0.1:8000/cartTotal/?cart=${cart}`;
    return this.http.delete(apiURL);
  }
  
  /** addCartItems*/
  addCartItems(product:any,cart:any) {
    let apiURL = `http://127.0.0.1:8000/cartItem/?product=${product}&cart=${cart}&qty=1`;
    return this.http.post(apiURL, '');
  }
    /** GET order*/
  getOrders(): Observable<Order[]> {
    return this.http.get<Order[]>('http://127.0.0.1:8000/order');
  }

    /** addOrder*/
  addOrder(cart:any) {
    let apiURL = `http://127.0.0.1:8000/order/?cart=${cart}`;
    return this.http.post(apiURL, '');
  }

}
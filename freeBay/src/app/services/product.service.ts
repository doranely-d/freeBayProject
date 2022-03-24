import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Product } from '../models/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private productUrl = 'http://127.0.0.1:8000/product';  // Base URL to REST API
  
  constructor(private http: HttpClient) { }
  
  /** GET Products */
  getProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(this.productUrl);
  }

}
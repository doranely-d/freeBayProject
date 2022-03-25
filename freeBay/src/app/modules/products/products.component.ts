import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CartService } from 'src/app/services/cart.service';
import { ProductService } from 'src/app/services/product.service';
import Swal from 'sweetalert2';
import { Product } from '../../models/product.model';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  cart:any
  products: Product[] = [];
	
  constructor(private productService: ProductService,private cartService: CartService,private router: Router) { }

  ngOnInit(): void {
    this.getProducts();
    this.cart = localStorage.getItem('cart') as string;
    this.cart = JSON.parse( this.cart);
  }

  getProducts(): void {
    this.productService.getProducts().subscribe(products=> this.products = products);
	}

  addCartItems(product:any): void {
    this.cartService.addCartItems(product,this.cart.id).subscribe( data => {
      this.router.navigate(['cart']);
    },
    (err) => {
      console.log(err);
      }
    );
    }
}

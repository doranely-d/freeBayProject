import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/models/product.model';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {
  products: Product[] = [];
  
  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    this.getProducts()
  }

  getProducts(): void {
    this.productService.getProducts().subscribe(products=> this.products = products);
	}

}

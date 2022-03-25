import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Product } from 'src/app/models/product.model';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {
  products: Product[] = [];
  
  @ViewChild(MatPaginator)
  paginator!: MatPaginator;

  @ViewChild(MatSort)
  sort!: MatSort;

  showFirstLastButtons = true;
  load = false;
  refreshload = false;

  displayedColumns: string[] = [
    'id',
    'url_image',
    'name',
    'price',
    'qty',
  ];

  dataSource = new MatTableDataSource([]);
  responseApi: any = [];
  
  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    this.loadData(true)
  }

  getProducts(): void {
    this.productService.getProducts().subscribe(products=> this.products = products);
	}

  
  public loadData(is_reset:boolean){
    this.productService.getProducts().subscribe({
      next: (result: any) => {
        console.log(result)
        this.responseApi = result;
        this.dataSource.data = this.responseApi;
        this.dataSource.sort = this.sort;
      },
      complete: () => {
        this.load = true;
      },
      error: (error) => {
        console.log(error);
      },
    });
  }

  public ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  public updatePaginationSort() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  public applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  public announceSortChange(sortState: any) {
    if (!this.refreshload) {
      var numPagina = sortState.length / sortState.pageSize;
    var indexCallService = numPagina - 2;
    if (sortState.pageIndex >= indexCallService) {
      console.log('llamar servicio');
      this.refreshload = true;
      this.productService
        .getProducts()
        .subscribe({
          next: (result: any) => {
            for (var i = 0; i < result.length; i++) {
              this.responseApi.push(result[i]);
            }
            this.dataSource.data = this.responseApi;
            this.dataSource.sort = this.sort;
          },
          complete: () => {
            this.load = true;
            this.refreshload = true;
          },
          error: (error) => {
            console.log(error);
          },
        });
    }
    }
    
  }

}

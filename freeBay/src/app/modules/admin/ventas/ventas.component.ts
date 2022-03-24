import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-ventas',
  templateUrl: './ventas.component.html',
  styleUrls: ['./ventas.component.css']
})
export class VentasComponent implements OnInit {
  
  displayedColumns: string[] = [
    'id',
    'user',
    'name',
    'total',
    'total_qty',
    'created_at',
    'modified_at',
  ];

  public dataSource = new MatTableDataSource([]);

  @ViewChild(MatPaginator)
  paginator!: MatPaginator;

  @ViewChild(MatSort)
  sort!: MatSort;

  showFirstLastButtons = true;
  load = false;
  refreshload = false;

  public responseApi: any = [];

  constructor(private cartService: CartService) {}

  ngOnInit(): void {
    this.loadData(true)
  }

  public loadData(is_reset:boolean){
    this.cartService.getOrders().subscribe({
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
      this.cartService
        .getOrders()
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



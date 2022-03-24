import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { LoginComponent } from './modules/authentication/login/login.component';
import { RegisterComponent } from './modules/authentication/register/register.component';
import { VentasComponent } from './modules/admin/ventas/ventas.component';
import { LayoutComponent } from './pages/layout/layout.component';
import { HomeComponent } from './pages/home/home.component';
import { CartComponent } from './pages/cart/cart.component';
import { FooterComponent } from './pages/footer/footer.component';
import { ProductsComponent } from './modules/products/products.component';
import { LayoutAComponent } from './modules/admin/layout-a/layout-a.component';
import { DashboardComponent } from './modules/admin/dashboard/dashboard.component';
import { ProductosComponent } from './modules/admin/productos/productos.component';
import { FooterAComponent } from './modules/admin/footer-a/footer-a.component';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    VentasComponent,
    LayoutComponent,
    HomeComponent,
    CartComponent,
    FooterComponent,
    ProductsComponent,
    LayoutAComponent,
    DashboardComponent,
    ProductosComponent,
    FooterAComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    MatProgressBarModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

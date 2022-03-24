import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './modules/authentication/login/login.component';
import { RouterModule, Routes } from '@angular/router';
import { RegisterComponent } from './modules/authentication/register/register.component';
import { HomeComponent } from './pages/home/home.component';
import { VentasComponent } from './modules/admin/ventas/ventas.component';
import { CartComponent } from './pages/cart/cart.component';
import { ProductosComponent } from './modules/admin/productos/productos.component';
import { DashboardComponent } from './modules/admin/dashboard/dashboard.component';
import { AuthorizatedGuard } from './guard/authorizated.guard';

const routes: Routes = [
  {
    path: '',
    component: HomeComponent,
  },
  {
    path: 'ventas',
    component: VentasComponent, canActivate: [ AuthorizatedGuard ],
  },
  {
    path: 'productos',
    component: ProductosComponent,canActivate: [ AuthorizatedGuard ],
  },
  {
    path: 'dashboard',
    component: DashboardComponent,canActivate: [ AuthorizatedGuard ],
  },
  {
    path: 'cart',
    component: CartComponent,
  },
  {
    path: 'login',
    component: LoginComponent,
  },
  {
    path: 'registro',
    component: RegisterComponent,
  },
  { path: '**', redirectTo: '' },
];


@NgModule({
  declarations: [],
  exports: [RouterModule],
  imports: [
    CommonModule,
    RouterModule.forRoot(routes)
  ]
})
export class AppRoutingModule { }

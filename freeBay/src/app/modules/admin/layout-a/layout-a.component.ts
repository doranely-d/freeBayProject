import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-layout-a',
  templateUrl: './layout-a.component.html',
  styleUrls: ['./layout-a.component.css']
})
export class LayoutAComponent implements OnInit {
  public user = ''
  public username: any;

  constructor(private router : Router,private authService: AuthService) { }

  ngOnInit(): void {
    this.username = localStorage.getItem('user') as string;
    this.username = JSON.parse(this.username);
    this.user = this.username.username;
  }

  logout() {
    this.authService.logout(localStorage.getItem('token')).subscribe( data => {
      localStorage.removeItem("user");
      localStorage.removeItem("sesion");
      localStorage.removeItem("token");
      this.router.navigate(['/']);
    });
  }
}

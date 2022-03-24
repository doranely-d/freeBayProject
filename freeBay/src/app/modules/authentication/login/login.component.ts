import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  password: string = '';
  email: string = '';
  progress_login = false;

  constructor(  private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
  }

  public onRegister() {
    this.router.navigate(['/registro']);      
  }

  public login(form_login : NgForm) {
    this.progress_login = true;

    if (form_login.valid) {
      const user = {username: form_login.value.email, password: form_login.value.password};
      this.authService.login(user).subscribe( data => {
      console.log(data['user']);
      this.save_sesion(
        JSON.stringify(data['user']),data['token']
      );
      this.sesion_user(true);
      this.router.navigate(['/']);
      form_login.reset();
      this.progress_login = false;
    },
    (err) => {console.log(err)});
    }
  }

  public save_sesion(data:any,token:any){
    localStorage.setItem('user', data);
    localStorage.setItem('token', token);
  }

  public sesion_user(sesion: any) {
    localStorage.setItem('sesion', sesion);
  }
}

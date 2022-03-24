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
  username: string = '';
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
      this.authService.login(form_login.value.username, form_login.value.password).subscribe( data => {
      console.log(data['user']);
      this.save_sesion(
        JSON.stringify(data['user']),data['token']
      );
      this.sesion_user(true);
      
      if (data['user']['role'].name == 'ROL_VENDEDOR') {
        this.router.navigate(['dashboard']);
      }else{
        this.router.navigate(['/']);
      }
      form_login.reset();
      this.progress_login = false;
    },
    (err) => {
      console.log(err);
      this.progress_login = false;
      Swal.fire({
        title: 'Error!',
        text: "Usuario o contraseña incorrecta",
        icon: 'error',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#39C0ED'
        })
      }
      );
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

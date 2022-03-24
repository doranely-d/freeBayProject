import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  email: string = '';
  password: string = '';
  username: string = '';
  progress_login = false;

  constructor( private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
  }

  public onLogin() {
    this.router.navigate(['/login']);      
  }

  public register(form_login : NgForm) {
    this.progress_login = true;

    if (form_login.valid) {
      this.authService.register(form_login.value.username, form_login.value.password, form_login.value.email).subscribe( data => {
      console.log(data['user']);
    },
    (err) => {
      console.log(err);
      this.progress_login = false;
      Swal.fire({
        title: 'Error!',
        text: "Error al registrar el usuario",
        icon: 'error',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#39C0ED'
        })
      }
      );
    }
  }

}

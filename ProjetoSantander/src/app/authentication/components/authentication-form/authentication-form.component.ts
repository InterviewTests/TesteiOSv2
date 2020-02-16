import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApiService } from 'src/app/services/api.service';
import { DataLogin } from 'src/app/model/login-data.model';

@Component({
  selector: 'app-authentication-form',
  templateUrl: './authentication-form.component.html',
  styleUrls: ['./authentication-form.component.scss']
})
export class AuthenticationFormComponent implements OnInit {

  loginForm:FormGroup;
  submitted:boolean = false;

  constructor(
    private apiService:ApiService,
    private formBuilder: FormBuilder,
  ) { }

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.pattern(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W+).*$/)]]
    });
  }

  submitForm():void{

    this.submitted = true;

    if(this.loginForm.valid){

      let dataLogin:DataLogin ={
        user:this.loginForm.get('username').value,
        password:this.loginForm.get('password').value
      }
      this.logIn(dataLogin);
      
    }

  }
  logIn(dataLogin:DataLogin):void{
    this.apiService.authentication(dataLogin).subscribe(data=>{
      if(data){
        
      }
    }, error=>{

    }, ()=>{

    });
  }

}

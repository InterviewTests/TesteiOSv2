import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApiService } from 'src/app/services/api.service';
import { DataLogin } from 'src/app/model/login-data.model';
import { UserService } from 'src/app/services/user.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { Router } from '@angular/router';
import { UtilService } from 'src/app/services/util.service';
import { StorageAccount } from 'src/app/model/storage-account.model';

@Component({
  selector: 'app-authentication-form',
  templateUrl: './authentication-form.component.html',
  styleUrls: ['./authentication-form.component.scss']
})
export class AuthenticationFormComponent implements OnInit {

  loginForm:FormGroup;
  submitted:boolean = false;
  errorLogin:boolean = false;
  errorServer:boolean = false;
  sucessAuthentication:boolean = false;
  storageAccount:StorageAccount = null;
  showProgressbar:boolean = false;

  constructor(
    private utilService:UtilService,
    public router: Router,
    private apiService:ApiService,
    private formBuilder: FormBuilder,
    private userService:UserService,
    private localStorageService: LocalStorageService
  ) { 
    if(this.userService.userAuthenticated){
      router.navigate(['/Home']);
    }
  }

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.pattern(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W+).*$/)]]
    });
    let storageData:any = null;
    try {
      storageData = this.localStorageService.get("data");
    } catch (error) {
    }
    if(storageData != undefined && storageData != null) {
      this.storageAccount = this.utilService.decryptData(storageData);
      this.loginForm.controls['username'].setValue(this.storageAccount.data);
    }

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
    //######################################################
    //Simulação de recebimento dos dados após a autenticação, será retirado na versão final
/*     let simulatedData:any = this.mockLogin();
    this.userService.userAccount = simulatedData.userAccount;
    this.localStorageService.saveData("data", this.utilService.encryptData({data:dataLogin.user, userFullName:this.userService.userAccount.name}));
    this.userService.userAuthenticated = true;
    this.router.navigate(['/Home']); */
    //######################################################
    this.showProgressbar = true;
    this.apiService.authentication(dataLogin).subscribe((data:any)=>{
      this.showProgressbar = false;
      if(data){
        try {
          this.userService.userAccount = data.userAccount;
          this.localStorageService.saveData("data", this.utilService.encryptData({data:dataLogin.user, userFullName:this.userService.userAccount.name}));
          this.userService.userAuthenticated = true;
          this.router.navigate(['/Home']);
          this.sucessAuthentication = true;
        } catch (error) {
          this.errorLogin = true;
          this.errorServer = true;
        }
      }else{
        this.showProgressbar = false;
        this.sucessAuthentication = false;
        this.errorServer = true;
      }
    }, error=>{
      this.showProgressbar = false;
      this.errorServer = true;
    });
  }
  mockLogin():any{
    let loginReturn:any = {
      userAccount: {
          userId: 1,
          name: "Jose da Silva Teste",
          bankAccount: "2050",
          agency: "012314564",
          balance: 3.3445
      },
      error: {}
    }
    return loginReturn;
  }
  clearStorageAccount(){
    this.storageAccount = null;
    this.localStorageService.clearAllData();
    this.loginForm.controls['username'].setValue("");
    this.userService.userAccount = null;
  }


  

}

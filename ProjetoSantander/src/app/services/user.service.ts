import { Injectable } from '@angular/core';
import { UserAccount } from '../model/user-account.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  userAccount:UserAccount = null;
  userAuthenticated:boolean = false;
  constructor() { }
}

//
//  LoginViewControllerDelegate.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

protocol LoginViewControllerDelegate
{
      func loginAction(_ userEmailOrCPF: String ,_ userPassword: String)
      
      func showErrorAlert(_ loginError: LoginError)
}

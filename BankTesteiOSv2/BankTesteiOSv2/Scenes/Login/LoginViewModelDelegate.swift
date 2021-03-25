//
//  protocolLoginViewControllerDelegate.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

protocol LoginViewModelDelegate
{
      func verifyEmailOrCPFAndPasswordAction(_ userEmailOrCPF: String ,_ userPassword: String )
  
      func checkEmail(_ userEmailOrCPF: String, _ userPassword: String)

      func checkCPF(_ userEmailOrCPF: String, _ userPassword: String)
}

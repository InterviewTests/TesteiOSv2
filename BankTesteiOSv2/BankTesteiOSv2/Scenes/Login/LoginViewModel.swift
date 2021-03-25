//
//  LoginViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

class LoginViewModel :  LoginViewModelDelegate
{
      var loginViewControllerDelegate: LoginViewControllerDelegate?
      
      func verifyEmailOrCPFAndPasswordAction(_ userEmailOrCPF: String, _ userPassword: String)
      {
            if !userEmailOrCPF.isEmpty
            {
                  if !userPassword.isEmpty
                  {
                        if userEmailOrCPF.contains("@")
                        {
                              checkEmail(userEmailOrCPF, userPassword)
                        }
                        else if(userEmailOrCPF.count == 11)
                        {
                              checkCPF(userEmailOrCPF, userPassword)
                        }
                        else
                        {
                              let loginError = LoginError.EmailOrCPFFail
                              self.loginViewControllerDelegate?.showErrorAlert(loginError)
                        }
                  }
                  else
                  {
                        let loginError = LoginError.PasswordFail
                        self.loginViewControllerDelegate?.showErrorAlert(loginError)
                  }
            }
            else
            {
                  let loginError = LoginError.AllDataFail
                  self.loginViewControllerDelegate?.showErrorAlert(loginError)
            }
      }
      
      func checkEmail(_ userEmail: String, _ userPassword: String)
      {
            if Regex.isRealEmail(userEmail)
            {
                  if Regex.isAcceptablePassword(userPassword)
                  {
                        self.loginViewControllerDelegate?.loginAction(userEmail, userPassword)
                  }
                  else
                  {
                        let loginError = LoginError.PasswordFail
                        self.loginViewControllerDelegate?.showErrorAlert(loginError)
                  }
            }
            else
            {
                  let loginError = LoginError.EmailFail
                  self.loginViewControllerDelegate?.showErrorAlert(loginError)
            }
      }
      
      func checkCPF(_ userCPF: String, _ userPassword: String)
      {
            if userCPF.isRealCPF
            {
                  if Regex.isAcceptablePassword(userPassword)
                  {
                        self.loginViewControllerDelegate?.loginAction(userCPF, userPassword)
                  }
                  else
                  {
                        let loginError = LoginError.PasswordFail
                        self.loginViewControllerDelegate?.showErrorAlert(loginError)
                  }
            }
            else
            {
                  let loginError = LoginError.CPFFail
                  self.loginViewControllerDelegate?.showErrorAlert(loginError)
            }
      }

}

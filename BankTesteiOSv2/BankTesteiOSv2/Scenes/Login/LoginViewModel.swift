//
//  classLoginViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import RxRelay

class LoginViewModel
{
      let userCredentials = UserCredentials()
            
      let emailOrCPFModel = EmailOrCPFModel()
      var passwordModel = PasswordModel()
      
      let isLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      let isSuccess : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      let errorMsg : BehaviorRelay<String> = BehaviorRelay(value: "")
            
      func validateEmailOrCPFCredentials() -> Bool
      {
            return emailOrCPFModel.validateData()
      }
      
      func validatePasswordCredentials() -> Bool
      {
            return passwordModel.validateData()
      }
      
      func loginUserCredentials()
      {
            userCredentials.userEmailOrCPF = emailOrCPFModel.data.value
            userCredentials.userPassword = passwordModel.data.value
            
            self.isLoading.accept( true )
            
            LoginProxy.loginUserAction( userCredentials.userEmailOrCPF, userCredentials.userPassword )
            { [self] (success, userLogin) in
                  if success
                  {
                        userWSLogin = userLogin
                        userEmailOrCPF = userCredentials.userEmailOrCPF
                        defaults.set(userEmailOrCPF, forKey: "userEmailOrCPF")
                        
                        passwordModel.data.accept( "" )
                                                                                                
                        self.isLoading.accept( false )
                        self.isSuccess.accept( true )
                        self.errorMsg.accept( "" )
                  }
                  else
                  {
                        self.isLoading.accept( false )
                        self.isSuccess.accept( false )
                        self.errorMsg.accept( LoginError.AllDataFail.rawValue )
                  }
            }
      }
}

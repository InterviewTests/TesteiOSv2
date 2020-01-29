//
//  LoginPresenter.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright (c) 2020 Arlen Ricardo Pereira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic
{
  func presentLogin(response: LoginModel.LoginRequestModel.Response)
}

class LoginPresenter: LoginPresentationLogic
{
  weak var viewController: LoginDisplayLogic?
  
  // MARK: Do something
  
  func presentLogin(response: LoginModel.LoginRequestModel.Response)
  {
    var dataResult: [LoginModel.LoginRequestModel.ViewModel.DisplayLogin] = []
    var codeResult: String = ""
    var msgResult: String = ""
    
    if !response.loginResponse.data!.isEmpty {
        for item in response.loginResponse.data! {
            dataResult.append(LoginModel.LoginRequestModel.ViewModel.DisplayLogin(userId: item.userId,
                                                                                  name: item.name,
                                                                                  bankAccount: item.bankAccount!,
                                                                                  balance: item.balance,
                                                                                  code: item.code,
                                                                                  message: item.message)
            )
        }
    }
    
    if response.loginResponse.code != nil || response.loginResponse.message != nil {
        codeResult = response.loginResponse.code!
        msgResult = response.loginResponse.message!
        
        switch codeResult {
        case "-1003":
            msgResult = "Não foi possivel conectar com o servidor, tente mais tarde..."
            break
            
        case "-1202":
            msgResult = "Certificado Invalido."
            break
            
        case "4":
            msgResult = "Certificado Invalido."
            break
            
        default:
            break
        }
    }
    
    let viewModel = LoginModel.LoginRequestModel.ViewModel(data: dataResult, message: msgResult, code: codeResult)
    viewController?.displayLogin(viewModel: viewModel)
  }
}

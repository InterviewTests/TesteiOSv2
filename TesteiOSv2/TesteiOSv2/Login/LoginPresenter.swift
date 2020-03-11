//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 10/03/20.
//  Copyright (c) 2020 Mônica Marques. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic
{
    func presentSomething(response: Login.Something.Response)
    func showInvalidUser()
    func showInvalidPassword()
    
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Login.Something.Response)
    {
        let viewModel = Login.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func showInvalidUser() {
        self.viewController?.showAlertErrorMessage(message: "O usuário deve ser um email ou cpf")
    }
    func showInvalidPassword() {
        self.viewController?.showAlertErrorMessage(message: "A senha deve ter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico")
        
    }
    
    
}

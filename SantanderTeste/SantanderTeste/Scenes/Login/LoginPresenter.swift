//
//  LoginPresenter.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
protocol LoginPresentationLogic
{
    func presentLogin(response: Login.fetchlogin.Response)
    func presentError(error: String)
}

class LoginPresenter: LoginPresentationLogic
{
   
    
    weak var viewController: LoginDisplayLogic?
    
    func presentError(error: String) {
        viewController?.displayError(error: error)
    }
    
    func presentLogin(response: Login.fetchlogin.Response) {
        guard let login = response.LoginResponse?.userAccount else{
            viewController?.displayError(error: "Erro Genérico ")
            return
        }
        
        var displayLogin: Login.fetchlogin.ViewModel.DisplayViewModel
        let display =
            Login.fetchlogin.ViewModel.DisplayViewModel(
                userId: String(describing: login.userId) ,
                name: login.name ?? "-",
                bankAccount: login.bankAccount ?? "-",
                agency: login.agency ?? "-",
                balance: String(describing: login.balance))
        displayLogin = display
        
        let viewModel = Login.fetchlogin.ViewModel(displayLogin: displayLogin)
        viewController?.displayFetchLogin(viewModel: viewModel)
    }
   
}

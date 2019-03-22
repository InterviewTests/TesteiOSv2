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
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    
    func presentLogin(response: Login.fetchlogin.Response) {
        guard let responseLogin = response.LoginResponse else{
            return
        }
        
        var displayLogin: Login.fetchlogin.ViewModel.DisplayViewModel
        let login = responseLogin.userAccount
        let display =
            Login.fetchlogin.ViewModel.DisplayViewModel(
            userId: String(login.userId),
            name: login.name,
            bankAccount: login.bankAccount,
            agency: login.agency,
            balance: String(login.balance)
        )
        displayLogin = display
        
        let viewModel = Login.fetchlogin.ViewModel(displayLogin: displayLogin)
        viewController?.displayFetchLogin(viewModel: viewModel)
    }
   
}

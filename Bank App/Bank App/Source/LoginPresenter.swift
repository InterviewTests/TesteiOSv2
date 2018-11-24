//
//  LoginPresenter.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    
    func showIntroForUser(response: LoginObject.FetchLogin.Response)
    func showErrorForLogin(error: Error?)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginControllerDisplayLogic?
    
    func showIntroForUser(response: LoginObject.FetchLogin.Response) {
        var displayUser: LoginObject.FetchLogin.ViewModel.DisplayUser?
        
        if let user = response.user {
            let _user = LoginObject.FetchLogin.ViewModel.DisplayUser(userId: user.userId, name: user.name, bankAccount: user.bankAccount, agency: user.agency, balance: user.balance)
            displayUser = _user
        }
        else {
            return
        }
        
        let viewModel = LoginObject.FetchLogin.ViewModel(user: displayUser)
        viewController?.displayIntroForUser(userModel: viewModel)
    }
    
    func showErrorForLogin(error: Error?) {
        
    }
}

//
//  IntroInteractor.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

/*
 - Trata das ações de interação fora do app, servidor, cor data entre outros.
 */
protocol IntroBusinessLogic {
    func loginUser(user: UserLogin)
    func tryAutoLogin()
}

class IntroInteractor: IntroBusinessLogic, UserAccountData {
    var userAccount: UserAccountable?
    var presenter: IntroPresentationLogic?
    
    func loginUser(user: UserLogin) {
        self.presenter?.showLoading()
        
        if validUserPassword(user) {
            self.tryLogin(user: user)
        }
        else {
            self.presenter?.catchPasswordInvalid()
        }
    }
    
    /// Try Auto login
    func tryAutoLogin() {
        let user = KeychainWorker().getUserLogin()
        
        if user.user != nil {
            loginUser(user: user)
        }
    }
    
    private func tryLogin(user: UserLogin) {
        BankWorker().userLogin(user) { (userResponse) in
            if let bankError = userResponse?.error, bankError.code != nil {
                
                KeychainWorker().deleteUser()
                self.presenter?.showError(error: bankError)
            }
            else if let userAccount = userResponse?.userAccount {
                self.userAccount = userAccount
                
                KeychainWorker().saveUserLogin(login: user)
                self.presenter?.showHistoryController()
            }
        }
    }
    
    /// Asks for user validation.
    private func validUserPassword(_ user: UserLogin) -> Bool {
        guard let password = user.password else { return false }
        return password.isValidPassword()
    }
}

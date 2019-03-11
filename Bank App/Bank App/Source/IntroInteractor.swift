//
//  IntroInteractor.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit
import WatchConnectivity

/*
 - Trata das ações de interação fora do app, servidor, cor data entre outros.
 */
protocol IntroBusinessLogic {
    func loginUser(user: UserLogin)
    func tryAutoLogin()
    func resetStatusBar()
    func verifyFields(_ fields: [UITextField])
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
        else {
            let error = BankErrorType.userNotFound.error
            presenter?.abortAutoLogin(error: error)
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
                self.sendUserAccountToAppleWatch(userAccount)
                self.presenter?.showHistoryController()
            }
        }
    }
    
    func resetStatusBar() {
        presenter?.setDefaultStatusBar()
    }
    
    func verifyFields(_ fields: [UITextField]) {
        var enabled: [Bool] = []
        for field in fields {
            if let text = field.text, text != "" {
                enabled.append(true)
            }
            else {
                enabled.append(false)
            }
            presenter?.enableLoginButton(!enabled.contains(false))
        }
    }
}

extension IntroInteractor {
    
    /// Asks for user validation.
    fileprivate func validUserPassword(_ user: UserLogin) -> Bool {
        guard let password = user.password else { return false }
        return password.isValidPassword()
    }
    
    fileprivate func sendDataFromAppleWatch(dict: [String: Any]) {
        do {
            try WCSession.default.updateApplicationContext(dict)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    fileprivate func sendUserAccountToAppleWatch(_ userAccount: UserAccountable) {
        guard let _ = userAccount.name else { return }
        sendDataFromAppleWatch(dict: ["name": userAccount.name!])
        sendDataFromAppleWatch(dict: ["agency": userAccount.agency!])
        sendDataFromAppleWatch(dict: ["bankAccount": userAccount.bankAccount!])
        sendDataFromAppleWatch(dict: ["balance": userAccount.balance!])
    }
}

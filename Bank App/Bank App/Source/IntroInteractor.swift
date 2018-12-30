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

protocol IntroInteractorLogic {
    
    func loginUser(user: UserLogin)
}


class IntroInteractor: IntroInteractorLogic, UserAccountData {
    var userAccount: UserAccountable?
    
    var presenter: IntroPresentationLogic?
    
    func loginUser(user: UserLogin) {
        
        BankWorker().userLogin(user) { (userResponse) in
            if let bankError = userResponse?.error {
                self.presenter?.showError(error: bankError)
            }
            else if let userAccount = userResponse?.userAccount {
                self.userAccount = userAccount
                self.presenter?.showHistoryController()
            }
        }
    }
}

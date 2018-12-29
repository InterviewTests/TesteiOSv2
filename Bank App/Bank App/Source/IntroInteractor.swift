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
        
        BankWorker().userLogin(user) { (account) in
            self.userAccount = account
            self.presenter?.showHistoryController()
        }
    }
}

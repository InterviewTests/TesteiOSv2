//
//  BankHistoryInteractor.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol BankHistoryInteractionLogic {
    
    func clearAutoLogin()
}

class BankHistoryInteractor: BankHistoryInteractionLogic, UserAccountData {
    
    var userAccount: UserAccountable?
    var presenter: BankHistoryPresentationLogic?
    
    func clearAutoLogin() {
        KeychainWorker().deleteUser()
    }
}

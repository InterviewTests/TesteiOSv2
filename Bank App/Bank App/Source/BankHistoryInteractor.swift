//
//  BankHistoryInteractor.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol BankHistoryInteractionLogic {
    
    func getStatementList(by userId: UserAccountable)
    func clearAutoLogin()
}

class BankHistoryInteractor: BankHistoryInteractionLogic, UserAccountData {
    
    var userAccount: UserAccountable?
    var presenter: BankHistoryPresentationLogic?
    
    func getStatementList(by user: UserAccountable) {
        guard let userId = user.userId else { return }
        
        BankWorker().statementList(by: userId) { (statementResponse) in
            if let bankError = statementResponse?.error, bankError.code != nil {
                self.presenter?.showError(error: bankError)
            }
            else if let statementList = statementResponse?.statementList {
                self.presenter?.displayStatements(statementList)
            }
        }
    }
    
    func clearAutoLogin() {
        KeychainWorker().deleteUser()
    }
}

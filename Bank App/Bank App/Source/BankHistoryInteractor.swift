//
//  BankHistoryInteractor.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol BankHistoryInteractionLogic {
    
    func getStatementList()
    func clearAutoLogin()
}

class BankHistoryInteractor: BankHistoryInteractionLogic, UserAccountData {
    
    var userAccount: UserAccountable?
    var presenter: BankHistoryPresentationLogic?
    
    func getStatementList() {
        BankWorker().statementList { (statementResponse) in
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

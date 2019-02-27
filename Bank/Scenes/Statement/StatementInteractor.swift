//
//  StatementInteractor.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

protocol StatementBusinessLogic {
    func loadViewData()
    func cleanData()
}

protocol StatementDataStore {
    var user: User? { get set }
}

class StatementInteractor: StatementBusinessLogic, StatementDataStore {
    var presenter: StatementPresentationLogic?
    
    var user: User?
    var bankWorker = BankWorker(bankStore: BankAPI())
    
    func loadViewData() {
        presenter?.loadViewDataUser(user: user)
        do{
            try bankWorker.getStatements(userId: (user?.userId)!) { (statementsApi, error) in
                if let error = error
                {
                    self.presenter?.showErrorMessage(message: error.localizedDescription)
                    self.presenter?.loadViewDataStatement(statements: nil)
                }
                else
                {
                    self.presenter?.loadViewDataStatement(statements: statementsApi)
                }
            }
        }
        catch {
            self.presenter?.showErrorMessage(message: "Ocorreu um problema ao tentar o extrato! Tente novamente")
        }
    }
    
    func cleanData() {
        user = nil
        presenter?.cleanData()
    }
}

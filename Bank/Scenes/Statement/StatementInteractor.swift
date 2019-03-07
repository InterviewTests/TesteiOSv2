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
    var bankWorker: BankWorkerProtocol
    
    init() {
        bankWorker = BankWorker(bankStore: BankAPI())
    }
    
    init(worker: BankWorkerProtocol) {
        bankWorker = worker
    }
    
    func loadViewData() {
        presenter?.loadViewDataUser(user: user)
        do{
            try bankWorker.getStatements(userId: (user?.userId)!) { (statementsApi, error) in
                if let error = error
                {
                    var errorMsg = ""
                    switch (error) {
                    case .badRequest(let msg), .urlInvalid(let msg):
                        errorMsg = msg
                    case .authenticationError(_):
                        errorMsg = "Ocorreu um erro não esperado. Cod.: 1"
                    }
                    self.presenter?.showErrorMessage(message: errorMsg)
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

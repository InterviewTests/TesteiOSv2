//
//  StatementsInteractor.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

protocol StatementsBusinessLogic {
    func getUserLogin(request: Statements.Request)
    func getStatementList(request: Statements.Request)
    func getOut(request: Statements.Request)
}

protocol StatementsDataStore {
    var userLogin: UserLogin! { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore {
       
    var userLogin: UserLogin!
    var presenter: StatementsPresentationLogic?
    var worker = Workers(withEnvironment: .production)

    func getUserLogin(request: Statements.Request) {
        presenter?.presentGetUserLogin(response: Statements.Response(userLogin: userLogin))
    }
    
    func getStatementList(request: Statements.Request) {
        worker.statementsFetch(userId: request.userAccount?.userId ?? 0) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.presentGetStatements(response: Statements.Response(statementList: response))
                break
            case .failure(let error):
                self.presenter?.presentGetStatementsError(response: Statements.Response(error: error))
            }
        }
    }
    
    func getOut(request: Statements.Request) {
        presenter?.presentGetOut(response: Statements.Response())
    }
}

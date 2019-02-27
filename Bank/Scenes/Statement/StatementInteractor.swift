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
    var statementUser: StatementView.ViewModel.DisplayedStatementUser?
    
    func loadViewData() {
        if(statementUser == nil) {
            statementUser = StatementView.ViewModel.DisplayedStatementUser(user: user)
        }
        presenter?.loadViewData(user: statementUser)
    }
    
    func cleanData() {
        user = nil
        statementUser = nil
        presenter?.cleanData()
    }
}

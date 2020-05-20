//
//  StatementsPresenter.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

protocol StatementsPresentationLogic {
    func presentGetUserLogin(response: Statements.Response)
    func presentGetStatements(response: Statements.Response)
    func presentGetStatementsError(response: Statements.Response)
    func presentGetOut(response: Statements.Response)
}

class StatementsPresenter: StatementsPresentationLogic {
    
    weak var viewController: StatementsDisplayLogic?

    func presentGetOut(response: Statements.Response) {
        let viewModel = Statements.ViewModel()
        viewController?.displayGetOut(viewModel: viewModel)
    }
    
    func presentGetUserLogin(response: Statements.Response) {
        let viewModel = Statements.ViewModel(userLogin: response.userLogin)
        viewController?.displayUser(viewModel: viewModel)
    }
    
    func presentGetStatements(response: Statements.Response) {
        let viewModel = Statements.ViewModel(statementList: response.statementList)
        viewController?.displayStatements(viewModel: viewModel)
    }
    
    func presentGetStatementsError(response: Statements.Response) {
        viewController?.displayStatementsError(viewModel: Statements.ViewModel(error: response.error))

    }
}

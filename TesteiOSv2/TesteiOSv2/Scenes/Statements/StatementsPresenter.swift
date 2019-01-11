//
//  StatementsPresenter.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol StatementsPresentationLogic {
    func showStatements(response: Statements.GetStatements.Response)
}

class StatementsPresenter: StatementsPresentationLogic {
    weak var viewController: StatementsDisplayLogic?
    
    func showStatements(response: Statements.GetStatements.Response) {
        let viewModel = Statements.GetStatements.ViewModel(statements: response.statements)
        viewController?.showStatements(viewModel: viewModel)
    }
}

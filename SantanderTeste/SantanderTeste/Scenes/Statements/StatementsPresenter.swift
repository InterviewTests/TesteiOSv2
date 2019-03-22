//
//  StatementsPresenter.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

protocol StatementsPresentationLogic
{
    func presentStatements(response: Statements.fetchStatements.Response)
}

class StatementsPresenter: StatementsPresentationLogic
{
    weak var viewController: StatementsDisplayLogic?
    
    // MARK: Do something
    
    func presentStatements(response: Statements.fetchStatements.Response)
    {
        /*let viewModel = Statements.fetchStatements.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)*/
        guard let responseStatement = response.StatementsResponse else {
           // viewController?.errorFetchingFunds//(message: response.message ?? "-")
       
            return
        }
        
        var displayStatements: [Statements.fetchStatements.ViewModel.DisplayViewModel] = []
        for statements in responseStatement.statementList{
            let displayStatement = Statements.fetchStatements.ViewModel.DisplayViewModel(
                title: statements.title,
                 desc: statements.desc,
                 date: statements.date,
                value: "\(statements.value)"
            )
              displayStatements.append(displayStatement)
        }
      
        
        let viewModel = Statements.fetchStatements.ViewModel(displayStatements: displayStatements)
        viewController?.displayFetchedStatements(viewModel: viewModel)
    }
}

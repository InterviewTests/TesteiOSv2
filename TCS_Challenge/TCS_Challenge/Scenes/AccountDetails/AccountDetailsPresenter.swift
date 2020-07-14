//
//  AccountDetailsPresenter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol AccountDetailsPresentationLogic {
    func logoutUser()
    func presentFetchedStatements(response: AccountDetails.FetchStatements.Response)
    func presentLoginError(error: Error)
}

class AccountDetailsPresenter: AccountDetailsPresentationLogic {

    weak var viewController: AccountDetailsDisplayLogic?
    
    func presentFetchedStatements(response: AccountDetails.FetchStatements.Response) {
        var displayedStatements: [AccountDetails.FetchStatements.ViewModel.DisplayedStatement] = []
        
        for statements in response.statementList {
            let title = statements.title
            let desc = statements.desc
            let date = statements.date
            let value = "R$ \(statements.value)"
            
            let displayedStatement = AccountDetails.FetchStatements.ViewModel.DisplayedStatement(title: title, desc: desc, date: date, value: value)
            displayedStatements.append(displayedStatement)
        }
        
        let viewModel = AccountDetails.FetchStatements.ViewModel(displayedStatements: displayedStatements)
        viewController?.displayFetchedStatements(viewModel: viewModel)
    }
    
    func logoutUser() {
        
    }
    
    func presentLoginError(error: Error) {
        
    }
}

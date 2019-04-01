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
    func presentuser(response: UserModel)
    func presentError(error: String)
}

class StatementsPresenter: StatementsPresentationLogic
{
   
    
   
    func presentError(error: String) {
        viewController?.displayError(error: error)
    }
    
    weak var viewController: StatementsDisplayLogic?
    
    // MARK: Do something
    
    func presentStatements(response: Statements.fetchStatements.Response)
    {

        guard let statementList = response.StatementsResponse?.statementList else {
           viewController?.displayError(error: "Erro Genérico")
            return
        }
        
        var displayStatements: [Statements.fetchStatements.ViewModel.DisplayViewModel] = []
    
        for statements in statementList{
            let displayStatement = Statements.fetchStatements.ViewModel.DisplayViewModel(
                title: statements.title ?? "-",
                 desc: statements.desc ?? "-",
                 date: statements.date ?? "-",
                 value: "\(String(describing: statements.value!))"
            )
              displayStatements.append(displayStatement)
        }
      
        
        let viewModel = Statements.fetchStatements.ViewModel(displayStatements: displayStatements)
        viewController?.displayFetchedStatements(viewModel: viewModel)
    }
    
    func presentuser(response: UserModel) {
        guard let login = response.userAccount else {
            viewController?.displayError(error: "Erro Genérico")
            return
        }
        var displayLogin: Statements.User.ViewModel.DisplayViewModel
        let display  =
            Statements.User.ViewModel.DisplayViewModel(
                userId: String(describing: login.userId!) ,
                name: login.name ?? "-",
                bankAccount: login.bankAccount ?? "-",
                agency: login.agency ?? "-",
                balance: String(describing: login.balance!))

        displayLogin = display
        let viewModel = Statements.User.ViewModel(displayLogin: displayLogin)
        viewController?.displayFetchLogin(viewModel: viewModel)
    }
}

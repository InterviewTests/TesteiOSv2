//
//  StatementPresenter.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

protocol StatementPresentationLogic {
    func showErrorMessage(message: String)
    func loadViewDataUser(user: User?)
    func loadViewDataStatement(statements: [Statement]?)
    func cleanData()
}

class StatementPresenter: StatementPresentationLogic {
    weak var viewController: StatementDisplayLogic?
    
    let dateShort: DateFormatter = {
        let dateShort = DateFormatter()
        dateShort.dateFormat = "yyyy-MM-dd"
        //dateShort.timeStyle = .none
        return dateShort
    }()
    
    let dateDisplay: DateFormatter = {
        let dateDisplay = DateFormatter()
        dateDisplay.dateFormat = "dd/MM/yyyy"
        //dateDisplay.timeStyle = .none
        return dateDisplay
    }()
    
    func showErrorMessage(message: String) {
        viewController!.showErrorMessage(message: message)
    }
    
    func loadViewDataUser(user: User?) {
        DispatchQueue.main.async {
            if let user = user {
                let statementUser = StatementView.ViewModel.DisplayedStatementUser(user: user)
                self.viewController!.setUserData(statementUser)
            }
            else
            {
                self.viewController!.setUserData(StatementView.ViewModel.DisplayedStatementUser(user: nil))
            }
        }
    }
    
    func loadViewDataStatement(statements: [Statement]?) {
        var displayedStatements: [StatementView.ViewModel.DisplayedStatementItem] = []
        if let statementsItens = statements {
            for statement in statementsItens{
                let total = Helpers.formmaterCurrency(value: statement.value)
                let displayedStatement = StatementView.ViewModel.DisplayedStatementItem.init(title: statement.title, desc: statement.desc, date: dateDisplay.string(from:dateShort.date(from: statement.date)!), value: total)
                displayedStatements.append(displayedStatement)
            }
        }
        viewController?.setStatements(statementsDisplay: displayedStatements)
    }
    
    func cleanData() {
        viewController = nil
    }
}

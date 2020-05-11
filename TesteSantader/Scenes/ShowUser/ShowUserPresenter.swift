//
//  ShowUserPresenter.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol ShowUserPresentationLogic {
    func presentUser(response: ShowUser.ShowGreeting.Response)
    func presentStatementList(response: ShowUser.ShowStatementList.Response)
}

class ShowUserPresenter: ShowUserPresentationLogic {
    
    weak var viewController: ShowUserDisplayLogic?
    
    let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }()
    
    func presentUser(response: ShowUser.ShowGreeting.Response) {
        let user = response.userData.userAccount
        
        let name = user.name
        var agencyString = user.agency
        agencyString.insert(".", at: agencyString.index(agencyString.startIndex, offsetBy: 2))
        agencyString.insert("-", at: agencyString.index(agencyString.startIndex, offsetBy: 9))
        let agency = agencyString
        let bankAccount = user.bankAccount
        let balance = "R$ \(user.balance)"
        
        let viewModel = ShowUser.ShowGreeting.ViewModel(name: name, bankAgency: agency, account: bankAccount, balance: balance)
        
        viewController?.displayShowGreeting(viewModel: viewModel)
    }
    
    func presentStatementList(response: ShowUser.ShowStatementList.Response) {
        
        var displayedStatementList: [ShowUser.ShowStatementList.ViewModel.DisplayedStatement] = []
        
        for statementList in response.statementList {
            let title = statementList.title
            let desc = statementList.desc
            let date = statementList.date
            let value = statementList.value
            let displayedStatement = ShowUser.ShowStatementList.ViewModel.DisplayedStatement(title: title, desc: desc, date: date, value: value)
            displayedStatementList.append(displayedStatement)
        }
        
        let viewModel = ShowUser.ShowStatementList.ViewModel(displayedStatement: displayedStatementList)
        
        viewController?.displayStatement(viewModel: viewModel)
    }
    
}

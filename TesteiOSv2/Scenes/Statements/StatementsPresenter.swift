//
//  StatementsPresenter.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import Foundation

protocol StatementsPresentationLogic {
    func presentFetchedStatements(response: ListStatements.FetchStatements.Response)
}


class StatementsPresenter : StatementsPresentationLogic {
    
    weak var viewController: StatementsDisplayLogic?
    
    
    let numberFormatter : NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "pt_BR")
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.generatesDecimalNumbers = true
        return numberFormatter
        }()
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()

    
    func presentFetchedStatements(response: ListStatements.FetchStatements.Response) {
        
        //let n = numberFormatter.string(from: s?.value as! NSNumber) ?? ""
        
        
        if let user = (viewController as? StatementsViewController)?.router?.dataStore?.user {
            
            //MARK: Getting user data and presenting
            let balance = "R$ \(numberFormatter.string(from:user.balance as NSNumber) ?? "")"
            let account = "\(user.bankAccount) / \(user.agency)"
            let userDisplayed = ListStatements
                .FetchStatements
                .ViewModel
                .UserDisplayed(name: user.name, account: account, balance: balance)
            
            //MARK: Getting Statements data and presenting
            var statementsDisplayed = [ListStatements.FetchStatements.ViewModel.StatementDisplayed]()
            for _s in response.statements {
                var dtDisplayed = _s.date
                dateFormatter.dateFormat = "yyyy-MM-dd"
                if let date = dateFormatter.date(from: _s.date) {
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    dtDisplayed = dateFormatter.string(from: date)
                }
                let valueDisplayed = "R$ \(numberFormatter.string(from:_s.value as NSNumber) ?? "")"
                let sDisplayed = ListStatements
                    .FetchStatements
                    .ViewModel
                    .StatementDisplayed(title: _s.title,
                                        desc: _s.desc,
                                        date: dtDisplayed,
                                        value: valueDisplayed)
                statementsDisplayed.append(sDisplayed)
            }
            
            
            let viewModel = ListStatements
                .FetchStatements
                .ViewModel(userDisplayed: userDisplayed, statementsDisplayed: statementsDisplayed)
            viewController?.displayFetchedStatements(viewModel: viewModel)
        }
        
    }
    
    
}


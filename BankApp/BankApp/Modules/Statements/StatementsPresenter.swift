//
//  StatementsPresenter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

protocol StatementsPresenterProtocol: AnyObject {
    func presentUserInfo()
    func logout()
    
    func startRequest()
    func finishRequest()
    
    func presentFetchedStatements(response: ListStatement.FetchStatement.Response)
    func didFailToFetchStatement(_ errorMessage: String)
}

protocol StatementsPresenterDelegate: AnyObject {
    func showUserInfo(_ info: UserInfoViewModel)
    
    func startRequesting()
    func finishRequesting()
    
    func displayStatements(_ statementsList: ListStatement.FetchStatement.ViewModel)
    func showFailToFetchMessage(_ errorMessage: String)
}


class StatementsPresenter {
    weak var view: StatementsPresenterDelegate?
    var router: StatementsRouter?
}

extension StatementsPresenter: StatementsPresenterProtocol {
    func presentUserInfo() {
        guard let userInfo = User.shared.info else {
            view?.showUserInfo(UserInfoViewModel(name: "", account: "", balance: ""))
            return }
        
        let account = userInfo.bankAccount + " / " + Mask.mask(userInfo.agency, as: .agency)
        let valueFormatString = (userInfo.balance < 0)  ? "- R$ %.2f"  : "R$ %.2f"
        let balance = String(format: valueFormatString, locale: Locale(identifier: "pt_br"), abs(userInfo.balance))
        
        view?.showUserInfo(UserInfoViewModel(name: userInfo.name, account: account, balance: balance))
    }
    
    func logout() {
        router?.logout()
    }
    
    func startRequest() {
        view?.startRequesting()
    }
    
    func finishRequest() {
        view?.finishRequesting()
    }
    
    func presentFetchedStatements(response: ListStatement.FetchStatement.Response) {
        let displayedStatements = response.statementList.map( { statement -> ListStatement.FetchStatement.ViewModel.DisplayedStatement in
            
            let date = DateManager.convertDate(statement.date, fromFormat: .iso_short, toFormat: .pt_br) ?? statement.date
            
            let valueFormatString = (statement.value < 0)  ? "- R$ %.2f"  : "R$ %.2f"
            let value = String(format: valueFormatString, locale: Locale(identifier: "pt_br"), abs(statement.value))
            
            return ListStatement.FetchStatement.ViewModel.DisplayedStatement(title: statement.title, description: statement.desc, date: date, value: value)
        } )
        
        let viewModel = ListStatement.FetchStatement.ViewModel(displayedStatements: displayedStatements)
        
        view?.displayStatements(viewModel)
    }
    
    func didFailToFetchStatement(_ errorMessage: String) {
        view?.showFailToFetchMessage(errorMessage)
    }
}

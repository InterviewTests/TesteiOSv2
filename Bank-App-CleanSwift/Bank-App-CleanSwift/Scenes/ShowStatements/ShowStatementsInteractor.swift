//
//  ShowStatementsInteractor.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

protocol ShowStatementsBusinessLogic {
    func showUserAccountData(request: ShowStatements.UserAccountDescription.Request)
    func showStatements(request: ShowStatements.ShowStatements.Request)
}

protocol ShowStatementsDataStore {
    var userAccount: UserAccount! { get set }
}


class ShowStatementsInteractor: ShowStatementsBusinessLogic, ShowStatementsDataStore {
    func showStatements(request: ShowStatements.ShowStatements.Request) {
        
    }
    
    var userAccount: UserAccount!
    var presenter: ShowStatementsPresenter?
    
    func showUserAccountData(request: ShowStatements.UserAccountDescription.Request) {
        self.userAccount = request.userAccount
        
        let response = ShowStatements.UserAccountDescription.Response(userAccount: self.userAccount)
        
        presenter?.showUserInfo(response: response)
    }
}

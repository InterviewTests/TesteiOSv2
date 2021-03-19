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
    var userAccount: UserAccount!
    var presenter: ShowStatementsPresenter?
    
    var showStatementsHTTPRequestWorker: ShowStatementsHTTPRequestWorker!
    
    func showUserAccountData(request: ShowStatements.UserAccountDescription.Request) {
        self.userAccount = request.userAccount
        let response = ShowStatements.UserAccountDescription.Response(userAccount: self.userAccount)
        presenter?.showUserInfo(response: response)
    }
    
    func showStatements(request: ShowStatements.ShowStatements.Request) {
        if let userId = request.userId {            
            self.showStatementsHTTPRequestWorker = ShowStatementsHTTPRequestWorker()
            showStatementsHTTPRequestWorker.fetchStatements(ofUser: userId) { data in
                var response: ShowStatements.ShowStatements.Response?
                
                if let _ = data.error.code {
                    let errorData = data.error
                    response = ShowStatements.ShowStatements.Response(error: errorData)
                } else {
                    let statementDataArray = data.statementList
                    response = ShowStatements.ShowStatements.Response(statementDataArray: statementDataArray)
                }
                
                self.presenter!.showStatements(response: response!)
            }
        }
    }
}

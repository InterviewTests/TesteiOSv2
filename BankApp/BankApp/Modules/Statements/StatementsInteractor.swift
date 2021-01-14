//
//  StatementsInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

protocol StatementsInteractorProtocol: AnyObject {
    func viewDidLoad()
    func logout()
}


class StatementsInteractor {
    var presenter: StatementsPresenterProtocol?
    private var statementList: [StatementStruct]?
    
    func fetchStatement() {
        presenter?.startRequest()
        StatementRequester.getAll { response in
            self.presenter?.finishRequest()
            
            self.statementList = response.statementList
            let presenterResponse = ListStatement.FetchStatement.Response(statementList: response.statementList)
            self.presenter?.presentFetchedStatements(response: presenterResponse)
        } fail: { errorMessage in
            self.presenter?.finishRequest()
            self.presenter?.didFailToFetchStatement(errorMessage)
        }
    }
    
}

extension StatementsInteractor: StatementsInteractorProtocol {
    func logout() {
        User.shared.logout()
        
        presenter?.logout()
    }
    
    func viewDidLoad() {
        presenter?.presentUserInfo()
        fetchStatement()
    }
}

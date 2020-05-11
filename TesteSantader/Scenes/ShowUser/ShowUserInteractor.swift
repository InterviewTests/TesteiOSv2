//
//  ShowUserInteractor.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol ShowUserBusinessLogic {
    func showGreeting(request: ShowUser.ShowGreeting.Request)
    func getStatementList(request: ShowUser.ShowStatementList.Request)
    func logoutUser()
}

protocol ShowUserDataStore {
    var user: UserData? { get set }
    var statementList: [StatementList]? { get set }
}

class ShowUserInteractor: ShowUserBusinessLogic, ShowUserDataStore {
    
    var user: UserData?
    
    var statementList: [StatementList]?
    var userKeychainService: KeychainServiceProtocol?
    
    var presenter: ShowUserPresentationLogic?
    var bankApiWorker: BankAPIWorkerProtocol?
    var userKeychainWorker: KeychainWorkerProtocol?
  
    func showGreeting(request: ShowUser.ShowGreeting.Request) {
        let response = ShowUser.ShowGreeting.Response(userData: user!)
        presenter?.presentUser(response: response)
    }
    
    func logoutUser() {
        userKeychainService = userKeychainService ?? UserKeychainService()
        userKeychainService?.removeUserPassword()
    }
    
    
    // MARK: - Statement List
    
    func getStatementList(request: ShowUser.ShowStatementList.Request) {
        
        let userID = request.userID
        
        bankApiWorker = bankApiWorker ?? BankAPIWorker()
            
        bankApiWorker!.fetchStatementList(userID: userID) { (statementList) in
            
            self.statementList = statementList
            
            let response = ShowUser.ShowStatementList.Response(statementList: statementList)
            
            self.presenter?.presentStatementList(response: response)
        }
    }
    
}

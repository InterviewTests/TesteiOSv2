//
//  AuthenticationWorker.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol BankAPIWorkerProtocol {
    
    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?) -> Void)
    
    func fetchStatementList(userID: String, completionHandler: @escaping ([StatementList]) -> Void)
}

class BankAPIWorker: BankAPIWorkerProtocol {
    
    var userKeychainWorker: KeychainWorkerProtocol?
    
    var logging: Bool = false
    
    //talvez tirar da função optional do @escaping (User?) -> Void
    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?) -> Void) {
        let userBankAPI = UserBankAPIService()

        userBankAPI.fetchUser(userID: userID, password: password) { (userData, userStoreError) in
            if let user: UserData = userData {
                DispatchQueue.main.async {
                    self.logging = true
                    self.saveUserPassword(userID: userID, password: password)
                    completionHandler(user)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func fetchStatementList(userID: String, completionHandler: @escaping ([StatementList]) -> Void) {
        let userBankAPI = UserBankAPIService()

        userBankAPI.fetchStatementList(userID: userID) { (statementListData, userStoreError) in
            let statementList: [StatementList] = statementListData!.statementList
                DispatchQueue.main.async {
                    self.logging = true
                    completionHandler(statementList)
                }
        }
    }
    
    func saveUserPassword(userID: String, password: String) {
        userKeychainWorker = userKeychainWorker ?? UserKeychainWorker()
        userKeychainWorker?.saveData(userID: userID, password: password)
    }

    
}

// MARK: - Users store API

protocol UserStoreProtocol {
    
    // MARK: - CRUD operations - Optional error

    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?, UserStoreError?) -> Void)

}


// MARK: - User store CRUD operation errors

enum UserStoreError: Equatable, Error {
    
  case CannotFetch(String)
}

func ==(lhs: UserStoreError, rhs: UserStoreError) -> Bool{
    
  switch (lhs, rhs) {
  case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
  default: return false
  }
}

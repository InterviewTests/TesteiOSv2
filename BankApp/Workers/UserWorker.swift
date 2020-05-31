//
//  UserWorker.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/30/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation
class UserWorker
{
    var loginStore: LoginStoreProtocol
    
    init(loginStore: LoginStoreProtocol) {
        self.loginStore = loginStore
    }
}

typealias UserStoreFetchUserCompletionHandler = (UserStoreResult<UserAccount>) -> Void

enum UserStoreResult<U>
{
    case Success(result: U)
    case Failure(error: UserStoreError)
}

protocol LoginStoreProtocol {
    
    func loginUser(_ user: User, completionHandler: @escaping (UserAccount?, UserStoreError?) -> Void)
    
    func loginUser(_ user: User, completionHandler: @escaping (() throws -> UserAccount) -> Void)
    
    func loginUser(_ user: User, completionHandler: @escaping UserStoreFetchUserCompletionHandler)
}

// MARK: - User store CRUD operation errors

enum UserStoreError: Equatable, Error
{
    case CannotLogin(String)
}

func ==(lhs: UserStoreError, rhs: UserStoreError) -> Bool
{
    switch (lhs, rhs) {
        case (.CannotLogin(let a), .CannotLogin(let b)) where a == b: return true
        default: return false
    }
}

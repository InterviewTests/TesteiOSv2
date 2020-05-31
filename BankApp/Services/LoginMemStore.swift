//
//  LoginMemStore.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/30/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation

class LoginMemStore: LoginStoreProtocol {
    
    static var userAccount = UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
    
    func loginUser(_ user: User, completionHandler: @escaping (UserAccount?, UserStoreError?) -> Void) {
        completionHandler(type(of: self).userAccount , nil)
    }
    
}

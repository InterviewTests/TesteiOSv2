//
//  BankWorker.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

class BankWorker {
    
    var bankStore: BankAPIProtocol
    
    init() {
        self.bankStore = BankAPI()
    }
    
    // Request for login.
    func userLogin(_ userLogin: UserLogin, completionHandler: @escaping (UserResponse?) -> Void) {
        bankStore.loginUser(login: userLogin, completionHandler: completionHandler)
    }
    
    func statementList(by userId: Int, completionHandler: @escaping (StatementResponse?) -> Void) {
        bankStore.statementList(by: userId, completionHandler: completionHandler)
    }
}

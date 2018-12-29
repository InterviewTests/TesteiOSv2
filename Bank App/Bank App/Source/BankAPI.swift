//
//  BankAPI.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

class BankAPI: BankAPIProtocol {
    
    private var baseURL = "https://bank-app-test.herokuapp.com/api"
    
    func loginUser(login: UserLogin, completionHandler: @escaping (UserAccount) -> Void) {
        baseURL = "\(baseURL)/login"
        // add params
        // try request
    }
}

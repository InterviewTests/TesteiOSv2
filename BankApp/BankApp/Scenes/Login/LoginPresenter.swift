//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func presentError(message: String)
    func loginSuccess()
}

class LoginPresenter: LoginPresentationLogic {
    
    var view: LoginDisplayLogic
    
    init() {
        view = LoginViewController()
    }
    
    func presentError(message: String) {
        
    }
    
    func loginSuccess() {
        
    }
}

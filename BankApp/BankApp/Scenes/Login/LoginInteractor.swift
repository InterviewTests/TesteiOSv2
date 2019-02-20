//
//  LoginInteractor.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func login(user: String, password: String)
}

protocol LoginDataStore {
    var account: UserAccount? {get}
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var account: UserAccount?
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerProtocol?
    
    init() {
        worker = LoginWorker()
    }
    
    func login(user: String, password: String) {
        if validateFields(user, password){
            worker?.login(user: user, password: password, { userAccount in
                self.account = userAccount
                self.presenter?.loginSuccess()
            }, { errorMessage in
                self.presenter?.presentError(message: errorMessage)
            })
        }
    }
    
    private func validateFields(_ user: String, _ password: String) -> Bool {
        
        var isValid = true
        
        if (user.isEmpty) {
            isValid = false
            presenter?.presentError(message: "Campo usuário vazio")
        }
        return isValid
    }
}

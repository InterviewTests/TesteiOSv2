//
//  LoginInteractor.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic: AnyObject {
    func validateLogin(username: String?, password: String?)
}

extension LoginInteractor: LoginBusinessLogic {
    func validateLogin(username: String?, password: String?) {
        validateLogin(username, password)
    }
}

class LoginInteractor: NSObject {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerLogic?
    
    init(presenter: LoginPresentationLogic, worker: LoginWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    private func validateLogin(_ username: String?, _ password: String?) {
        guard let user = username, let pass = password, !user.isEmpty, !pass.isEmpty else {
            presenter?.presentUncompletedFieldsError()
            return
        }
        if isValidUsername(user) && isValidPassword(pass) {
            presenter?.presentSuccessLogin()
        } else {
            presenter?.presentErrorLogin()
        }
    }
    
    private func isValidUsername(_ username: String) -> Bool {
        return username.isValidEmail() || username.isValidCPF()
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.hasNumbers()
            && password.hasCapitalLetters()
            && password.hasSpecialCharacters()
    }
}

//
//  LoginInteractor.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol LoginBusinessLogic: class {
    func performLogin(request: Login.Request)
}

protocol LoginDataStore: class {
    var loginResponse: Login.Response? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: (LoginPresentationLogic & ErrorDisplayLogic)?
    var worker: LoginWorker?
    var loginResponse: Login.Response?

    func performLogin(request: Login.Request) {
        guard checkFields(request: request) else {
            return
        }
        worker = LoginWorker()
        worker?.performLogin(request: request, success: { [unowned self] response in
            self.loginResponse = response
            self.presenter?.logged(source: self)
            }, failure: { error in

        })
    }
}

extension LoginInteractor {

    func checkFields(request: Login.Request) -> Bool {
        guard checkCPF(request: request) else {
            return false
        }
        return true
    }

    func checkCPF(request: Login.Request) -> Bool {
        if let user = request.user, user.isCPF() {
            let result = user.isValidCPF()
            if !result {
                presenter?.showError(message: Localizable.CPF.localize())
                return false
            }
        }
        return true
    }

    func checkEmail(request: Login.Request) -> Bool {
        if let user = request.user, user.isValidEmail() {
            presenter?.showError(message: Localizable.Email.localize())
            return false
        }
        return true
    }

    func checkPassword(request: Login.Request) -> Bool {
        if let password = request.password, !password.isValidPassword() {
            presenter?.showError(message: Localizable.Email.localize())
            return false
        }
        return true
    }
}

//
//  LoginInteractor.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func tellStatements(request: Login.Request)
    func getUserData(request: Login.Request)
}

protocol LoginDataStore {
    var userLogin: UserLogin? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var userLogin: UserLogin?
    var presenter: LoginPresentationLogic?
    var worker = Workers(withEnvironment: .production)
    
    func tellStatements(request: Login.Request) {
        if isValidEmail(text: request.user?.user ?? "") || isValidCPF(text: request.user?.user ?? "") {
            if isValidPassword(password: request.user?.password ?? "") {
                loginFetch(request: request)
            } else {
                let error = setError(message: BankError.invalidPassword.localizedDescription, code: 1001)
                self.presenter?.presentTellStatementsError(response: Login.Response(error: error))
            }
        } else {
            let error = setError(message: BankError.isValidUser.localizedDescription, code: 1002)
            self.presenter?.presentTellStatementsError(response: Login.Response(error: error))
        }
    }
    
    func setError(message: String, code: Int) -> ErrorHandler {
        return  ErrorHandler(code: code, message: message)
    }
    
    func loginFetch (request: Login.Request) {
        worker.loginFetch(request: request.user ?? User(user: "", password: "")) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.userLogin = response
                self.setUserKeychain(request: request)
                self.presenter?.presentTellStatements(response: Login.Response(userLogin: response))
            case .failure(let error):
                self.userLogin?.error = error
                self.presenter?.presentTellStatementsError(response: Login.Response(error: error))
            }
        }
    }
    
    func getUserData(request: Login.Request) {
        let passwordRegister = getUserKeychain(key: "passwordRegister")
        let userRegister = getUserKeychain(key: "userRegister")
        presenter?.presentGetUserData(request: Login.Response(user: User(user: userRegister, password: passwordRegister)))
    }
    
    func setUserKeychain(request: Login.Request) {
        KeychainManager().store( request.user?.password ?? "", key: "passwordRegister")
        KeychainManager().store(request.user?.user ?? "", key: "userRegister")
    }
    
    func getUserKeychain(key: String) -> String? {
        return KeychainManager().retrieve(key: key)
    }
    
    func isValidPassword(password: String) -> Bool{
        return !(password.isValidPassword())
    }
    
    func isValidEmail(text: String) -> Bool {
        return !text.isValidEmail()
    }
    
    func isValidCPF(text: String) -> Bool {
        return text.isValidCPF()
    }
}


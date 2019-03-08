//
//  LoginInteractor.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

protocol LoginBusinessLogic {
    func validateLoginData(user: Login.ViewModel.DiplayedUser)
}

protocol LoginDataStore {
    var user: User? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    
    var bankWorker: LoginWorkerProtocol
    var user: User?
    
    init() {
        bankWorker = LoginWorker(bankStore: BankAPI())
    }
    
    init(worker: LoginWorkerProtocol) {
        bankWorker = worker
    }
    
    func autenticate(request: Login.ViewModel.DiplayedUser) {
        bankWorker.authenticate(user: request.login, password: request.password) { (user, error) in
            if let error = error
            {
                var msgError = ""
                switch (error) {
                case .authenticationError(let msg):
                    msgError = msg
                default:
                    break
                }
                self.presenter?.showErrorMessage(message: msgError)
            }
            else
            {
                self.user = user
                let saveSuccessful: Bool = KeychainWrapper.standard.set(request.login, forKey: "userName")
                if(saveSuccessful) {
                    self.presenter?.routeShowStatement()
                }
                else {
                    self.presenter?.showErrorMessage(message: "Ocorreu um problema na autenticação!")
                }
            }
        }
    }
    
    func validateLoginData(user: Login.ViewModel.DiplayedUser) {
        var dataValid = true
        var message = ""
        
        if(user.login.count == 0){
            dataValid = false
            message += "\r\nInforme o nome do usuário!"
        }
        else if(!Helpers.isValidEmail(email: user.login) && !Helpers.isValidCPF(cpf: user.login))
        {
            dataValid = false
            message += "\r\nInforme um usuário válido!"
        }
        
        if(user.password.count == 0){
            dataValid = false
            message += "\r\nInforme a senha!"
        }
        else if(!user.isPasswordValid())
        {
            dataValid = false
            message += "\r\nSenha incorreta!"
        }
        
        if(dataValid)
        {
            autenticate(request: user)
        }
        else
        {
            self.presenter?.showErrorMessage(message: message)
        }
    }
}

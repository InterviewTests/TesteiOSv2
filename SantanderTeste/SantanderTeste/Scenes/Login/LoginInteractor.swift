//
//  LoginInteractor.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
protocol LoginBusinessLogic
{
    func fetchLogin(request: Login.fetchlogin.Request)
}

protocol LoginDataStore
{
    var user: UserModel? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    
    var user: UserModel?
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    // MARK: Do something
    
    func fetchLogin(request: Login.fetchlogin.Request)
    {
        guard Rules().verifyPassword(Password: request.password) &&  Rules().isValidUser(user: request.user) else {
           presenter?.presentError(error: "Email ou Senha inválidos")
            return
        }
        
        
        worker = LoginWorker()
        worker?.requestUser(user: request.user, password: request.password, { [weak self] (user, error) in
            self?.user = user
            let response = Login.fetchlogin.Response(LoginResponse: user, error: error)
            self?.presenter?.presentLogin(response: response)
            
        })
        
    }
}

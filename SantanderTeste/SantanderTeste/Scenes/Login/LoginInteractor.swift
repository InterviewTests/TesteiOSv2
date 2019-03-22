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
    var loginResponse: Login.fetchlogin.Response? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    
    var loginResponse: Login.fetchlogin.Response?
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    // MARK: Do something
    
    func fetchLogin(request: Login.fetchlogin.Request)
    {
        worker = LoginWorker()
        worker?.requestUser(user: request.user, password: request.password, { [weak self] (response) in
            self?.loginResponse = response
            self?.presenter?.presentLogin(response: response)
            
        })
       /* let response = Login.fetchlogin.Response()
        presenter?.presentSomething(response: response)*/
        
    }
}

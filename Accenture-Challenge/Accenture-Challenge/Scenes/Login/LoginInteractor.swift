//
//  LoginInteractor.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol LoginBusinessLogic {
    func fetchLogin(request: Login.Info.LoginRequest)
}

protocol LoginDataStore {
    var loginResponse: Login.Info.LoginResponse? { get set }
}

class LoginInteractor: LoginDataStore {
    
    private var presenter: LoginPresentationLogic
    private var worker: LoginWorkerProtocol
    
    var loginResponse: Login.Info.LoginResponse?
    
    init(viewController: LoginDisplayLogic) {
        self.presenter = LoginPresenter(viewController: viewController)
        self.worker = LoginWorker()
    }

}

extension LoginInteractor: LoginBusinessLogic {
    
    func fetchLogin(request: Login.Info.LoginRequest) {
 
    }
}

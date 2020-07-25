//
//  LoginInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func login(with request: Login.Request)
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic?
    var worker: LoginNetworkLogic
    
    init(with worker: LoginNetworkLogic = LoginWorker()) {
        self.worker = worker
    }
    
    // MARK: Business logic
    func login(with request: Login.Request) {
        worker.performLogin(with: request).done(handleSuccess).catch(handleError)
    }
    
    func handleSuccess(response: Login.Response) {
        //let user = response.userAccount
    }
    
    func handleError(error: Error) {
        
    }
}

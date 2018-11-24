//
//  LoginInteractor.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/11/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

/**
 - Protocolo que implementa as regras de negócio externa pelo Interactor
 - A ViewController pede ao Interactor uma interação a um meio externo.
 */
protocol LoginBusinessLogic {
    func fetchUser(request: UserLogin.FetchUser.Resquest)
}

protocol UserData {
    var user: User? { get }
}

class LoginInteractor: LoginBusinessLogic, UserData {
    
    var presenter: LoginPresentationLogic?
    var userWorker: String?
    
    var user: User?
    
    /**
     - Try login request.
     */
    func fetchUser(request: UserLogin.FetchUser.Resquest) {
        // ...
    }
}

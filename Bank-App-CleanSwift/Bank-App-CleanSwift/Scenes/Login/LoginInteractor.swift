//
//  LoginInteractor.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginBusinessLogic: class {
    func applyBusinessLogicIn(request: Login.Login.Request)
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic!
    
    func applyBusinessLogicIn(request: Login.Login.Request) {
        // Aqui tenho que usar os workers para fazer as requisicoes http etc.
                
        let user = User(name: request.fields.username, password: request.fields.password)
        let response = Login.Login.Response(user: user)
        presenter.presentLoginResponse(response: response)
    }
}

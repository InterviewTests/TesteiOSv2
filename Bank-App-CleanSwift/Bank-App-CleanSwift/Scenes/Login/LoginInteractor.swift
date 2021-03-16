//
//  LoginInteractor.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginBusinessLogic: class {
    func applyBusinessLogic(request: Login.Login.Request)
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic!
    var fieldsValidationWorker: LoginFieldsValidationWorker!
    var httpRequestWorker: LoginHTTPRequestWorker!
    
    func applyBusinessLogic(request: Login.Login.Request) {
        let user = User(username: request.fields.username,
                        password: request.fields.password)
        
        let isUserValidBasedOnFields = self.validateFields(of: user)
        
        if isUserValidBasedOnFields {
            let name = self.doLoginInEndpoint(with: user)
            print(name)
        }
        
        let response = Login.Login.Response(user: user)
        presenter.presentLoginResponse(response: response)
    }
    
    private func validateFields(of user: User) -> Bool {
        fieldsValidationWorker = LoginFieldsValidationWorker()
        
        return fieldsValidationWorker.validate(user: user)
    }
    
    private func doLoginInEndpoint(with user: User) -> String {
        httpRequestWorker = LoginHTTPRequestWorker()        
        
        return httpRequestWorker.doLogin(with: user)
    }
}

//
//  LoginWorker.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginWorkerLogic: AnyObject {
    func makeLogin(model: LoginModels.Request)
}

class LoginWorker: LoginWorkerLogic {
    
    func makeLogin(model: LoginModels.Request) {
        var parameters = RequestParameters()
        parameters.body = [.init(name: LoginModel.CodingKeys.user.rawValue, value: model.login.user),
                           .init(name: LoginModel.CodingKeys.password.rawValue, value: model.login.password)]
        parameters.method = .post
        ApiManager.makeRequest(endpoint: .login, parameters: parameters, success: model.success, failure: model.failure)
    }
}

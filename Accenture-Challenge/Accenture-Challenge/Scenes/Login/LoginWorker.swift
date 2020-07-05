//
//  LoginWorker.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol LoginWorkerProtocol {
    func fetchLogin(request: Login.Info.LoginRequest)
}

class LoginWorker: LoginWorkerProtocol {
    
    func fetchLogin(request: Login.Info.LoginRequest) {
        let body = "user=\(request.user)&password=\(request.password)"
        let endpoint = EndPoint.login
        let httpMethod = HttpMethod.post
        
        APIProvider.shared.request(body: body,
                                   httpMethod: httpMethod,
                                   endpoint: endpoint) { response in
            
        }
    }
}

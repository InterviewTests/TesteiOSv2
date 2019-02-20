//
//  LoginWorker.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginWorkerProtocol{
    func login(user: String, password: String, _ onSuccess: @escaping (UserAccount) -> Void, _ onError: @escaping (String) -> Void)
}

class LoginWorker: LoginWorkerProtocol{
    
    var apiClient: ApiClient?
    
    init() {
        apiClient = ApiManager()
    }
    
    func login(user: String, password: String, _ onSuccess: @escaping (UserAccount) -> Void, _ onError:  @escaping (String) -> Void) {
        
        let params: [String: Any] = [
            "user" : "\(user)",
            "password" : "\(password)"
        ]
        
        apiClient?.request(type: LoginResponse.self,
                           endpoint: "login",
                           method: HTTPMethod.post,
                           parameters: params,
                           encoding: URLEncoding.default,
                           onSuccess: { response in
                            if let error = response.error.message{
                                onError(error)
                                return
                            }
                            onSuccess(response.userAccount)},
                           onError: { error in
                            //tratar erro, por exemplo quando estiver sem internet
                            onError("Ocorreu um erro :( ")})
    }
}

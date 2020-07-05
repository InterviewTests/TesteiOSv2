//
//  LoginWorker.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

protocol LoginWorkerProtocol {
    func fetchLogin(request: Login.Info.LoginRequest, completion: @escaping LoginResponseCallback)
}

enum LoginResponse {
    case success(Login.Info.LoginJSONModel)
    case error(Error)
    case genericError
}

class LoginWorker: LoginWorkerProtocol {
    
    func fetchLogin(request: Login.Info.LoginRequest, completion: @escaping LoginResponseCallback) {
        let body = "user=\(request.user)&password=\(request.password)"
        let endpoint = EndPoint.login
        let httpMethod = HttpMethod.post
        
        APIProvider.shared.request(body: body,
                                   httpMethod: httpMethod,
                                   endpoint: endpoint) { response in
                                    switch response {
                                    case .sucess(let data):
                                        do {
                                            let jsonModel = try JSONDecoder().decode(Login.Info.LoginJSONModel.self,
                                                                                     from: data)
                                            completion(.success(jsonModel))
                                        } catch {
                                            completion(.genericError)
                                        }
                                        break
                                    case .clientError(let error):
                                        completion(.error(error))
                                        break
                                    case .urlNotFound:
                                        completion(.genericError)
                                        break
                                    case .errorToFetchData:
                                        completion(.genericError)
                                    }
        }
    }
}

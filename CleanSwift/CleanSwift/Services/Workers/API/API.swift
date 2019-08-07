//
//  API.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-06.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import Alamofire

enum API: URLRequestConvertible {
    case login(username: String, password: String)
    case home(userId: String)
    
    private var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .home: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .login: return Constants.Service.login
        case .home(let userId): return "\(Constants.Service.home)\(userId)"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let username, let password):
            return [Constants.Service.user: username,
                    Constants.Service.password: password]
        case .home: return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var base = "https://bank-app-test.herokuapp.com/api/"

        let url = try base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.Service.json, forHTTPHeaderField: Constants.Service.contentType)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

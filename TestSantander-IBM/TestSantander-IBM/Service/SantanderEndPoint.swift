//
//  SantanderEndPoint.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case production
}

public enum SantanderApi {
    case userAccount(user:String, password: String)
    case statements(page:Int)
}

extension SantanderApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://bank-app-test.herokuapp.com/api/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .userAccount:
            return "login"
        case .statements(let id):
            return "statements/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .userAccount(_):
            return .post
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .userAccount(let user, let password):
            return .requestParametersAndHeaders(bodyParameters: ["user":user, "password":password], bodyEncoding: ParameterEncoding.jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type": "application/json; charset=utf-8"])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

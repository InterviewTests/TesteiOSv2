//
//  LoginServiceAPI.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Moya

enum UserServiceAPI{
    case login
    case Statements(id: String)
}

extension UserServiceAPI: TargetType{
    var baseURL: URL {
        return URL(string: Config.endPointURL)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/login"
        case .Statements(let id):
            return "/api/statements/" + id
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .get
        case .Statements:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login:
            return .requestPlain //.requestParameters(parameters: <#T##[String : Any]#>, encoding: JSONEncoding.default).requestPlain
        case .Statements:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return [:]
        case .Statements:
            return [:]
        }
    }
    
    
}

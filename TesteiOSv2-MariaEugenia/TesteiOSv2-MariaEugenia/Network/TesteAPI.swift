//
//  TesteAPI.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 10/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit
import Moya

enum TesteAPI {
    
    case login(login: String, password: String)
    case statements
    
}

extension TesteAPI : TargetType {
    
    var baseURL: URL {
        return URL(string: Config.Server.url)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .statements:
            return "statements/1"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default:
            return .get
            
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .login(let login, let password):
            return .requestParameters(parameters: ["user":login, "password":password], encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        let headers: [String : String] = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        return headers
    }
    
}

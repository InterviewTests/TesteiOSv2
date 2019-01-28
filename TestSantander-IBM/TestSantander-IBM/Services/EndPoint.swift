//
//  EndPoint.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 24/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit
import Alamofire

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var params: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
}

enum NetworkEnvironment {
    case production
}

public enum Api {
    case userAccount(userAccount: String, password: String)
    case statements(id: Int)
}

extension Api: EndPointType {
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
    
    var url: String {
        switch self {
        default: return "\(baseURL)\(path)"
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
    
    var params: [String : Any]? {
        switch self {
        case .userAccount(let user, let password):
            return ["user": user, "password": password]
        default:
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

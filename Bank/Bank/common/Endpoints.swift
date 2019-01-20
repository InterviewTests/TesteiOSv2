//
//  Endpoints.swift
//  Bank
//
//  Created by Thiago Lima on 15/01/19.
//  Copyright © 2019 SantanderTecnologia. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://bank-app-test.herokuapp.com/api"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Bank: Endpoint {
        case Login
        case Statements
        
        public var path: String {
            switch self {
            case .Login: return "/login"
            case .Statements: return "/statements/"
            }
        }
        public var url: String {
            switch self {
            default: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
}

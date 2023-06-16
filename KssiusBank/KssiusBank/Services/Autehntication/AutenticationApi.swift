//
//  AutenticationApi.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation


enum AutenticationApi{
    static let baseUrl = "http://"
    enum Endpoints {
        case loginRequest
    }
}
extension AutenticationApi.Endpoints {
    var endpoint: Endpoint {
        switch self {
        case .loginRequest:
            return Endpoint(path: "/login", method: .post, configuration: .init(baseUrl: AutenticationApi.baseUrl))
        }
    }
}



//
//  AutenticationApi.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation


enum AutenticationApi{
    static let baseUrl = "https://648bb0bf17f1536d65eb2264.mockapi.io/api"
    enum Endpoints {
        case loginRequest
    }
}
extension AutenticationApi.Endpoints {
    var endpoint: Endpoint {
        switch self {
        case .loginRequest:
            return Endpoint(path: "login", method: .post, configuration: .init(baseUrl: AutenticationApi.baseUrl))
        }
    }
}



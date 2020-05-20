//
//  Endpoint.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

class Endpoint {
    
    typealias EndpointType = (uri: String, method: String)
    
    struct HTTPMethod {
        static let get = "GET"
        static let post = "POST"
    }
    
    struct Login {
        static let userLogin: EndpointType = (uri: "/login", method: HTTPMethod.post)
    }
    
    struct Statement {
           static let statementList: EndpointType = (uri: "/statements", method: HTTPMethod.get)
       }
}

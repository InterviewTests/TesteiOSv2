//
//  Workers.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit


class Workers {
    
    var service: Service!
    
    init(withEnvironment environment: Environment) {
        service = Service(withEnvironment: environment)
    }
    
    func loginFetch(request: User, completion: @escaping (Result<UserLogin, ErrorHandler>) -> Void) {
        let header = HeaderHandler().generate(header: .basic)
        let url = service.urlComposer(using: Endpoint.Login.userLogin)
        let parameters = request.dictionary()
        let request = service.requestComposer(using: url, headers: header, body: parameters)
        service.fetch(using: request, success: { result in
            completion(.success(result))
        }, failure: { (error) in
            completion(.failure(error))
        })
    }
    
    func statementsFetch(userId: Int, completion: @escaping (Result<StatementList, ErrorHandler>) -> Void) {
        let header = HeaderHandler().generate(header: .application)
        var endPoint = Endpoint.Statement.statementList
        endPoint.uri = "\(endPoint.uri)/\(userId)"
        let url = service.urlComposer(using: endPoint)
        let request = service.requestComposer(using: url, headers: header)
        service.fetch(using: request, success: { result in
            completion(.success(result))
        }, failure: { (error) in
            completion(.failure(error))
        })
    }
    
}

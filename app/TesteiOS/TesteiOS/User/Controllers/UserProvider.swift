//
//  UserProvider.swift
//  TesteiOS
//
//  Created by Emerson Pereira on 15/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import Foundation
import Alamofire

protocol UserProviderDelegate: NSObjectProtocol {
    func success(statements: [StatementObject])
    func failure(error: Error)
}

class UserProvider {
    
    weak var delegate: UserProviderDelegate?
    
    func getStatements(userId: Int) {
        
        let url = URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(String(describing: userId))")
        
        Alamofire.request(url!, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let responseData = response.data {
                    self.parseStatements(data: responseData)
                }
        }
        
    }
}

extension UserProvider {
    func parseStatements(data: Data) {
        do {
            let statements = try JSONDecoder().decode(StatementsModel.self, from: data)
            delegate?.success(statements: statements.statementList)
        } catch {
            delegate?.failure(error: error)
        }
    }
}

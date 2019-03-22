//
//  StatementsWorker.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
//typealias responseHandler = (_ response: Statements.fetchStatements.Response) -> Void
class StatementsWorker
{
    typealias responseHandler = (_ response: Statements.fetchStatements.Response) -> Void
    func fetchStatements(id: String, _ completionHanlder: @escaping (responseHandler)){
        let endpoint = Config.endPointURL + Config.pathStatements(id: id)
        Alamofire.request(endpoint).responseJSON { (response) in
            let data = response.data!
            do {
                
                let statements = try JSONDecoder().decode(StatementsModel.self, from: data)
                completionHanlder(Statements.fetchStatements.Response(StatementsResponse: statements, UserResponse: nil, message: nil))
                
            }catch let error{
                completionHanlder(Statements.fetchStatements.Response(StatementsResponse: nil, UserResponse: nil, message: error.localizedDescription))
                return
            }
        }
    }
    
}

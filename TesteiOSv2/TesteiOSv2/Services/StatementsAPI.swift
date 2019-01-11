//
//  StatementsAPI.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StatementsAPI: StatementsStoreProtocol {
    let API = "https://bank-app-test.herokuapp.com/api/"
    
    func getStatements(completionHandler: @escaping ([Statement]?) -> Void) {
        Alamofire.request("\(self.API)statements/1", method: .get)
            .responseJSON { response in
                do {
                    if let error = response.error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    if let data = response.data {
                        let json = try JSON(data: data)
                        let statementList = json["statementList"]
                        
                        var statements = [Statement]()
                        for statement in statementList.array! {
                            statements.append(Statement(title: statement["title"].string ?? "", desc: statement["desc"].string ?? "", date: statement["date"].string ?? "", value: statement["value"].float ?? 0))
                        }
                        
                        completionHandler(statements)
                    }
                } catch {
                    return
                }
        }
    }
}

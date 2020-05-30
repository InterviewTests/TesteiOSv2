//
//  StatementService.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/29/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StatementAPI: StatementStoreProtocol {
    func fetchStatement(completionHandler: @escaping (() throws -> [Statement]) -> Void) {
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/1", method: .get)
            .responseJSON { response in
                if let data = response.data {
                    do {
                        let json = try JSON(data: data)
                        let statements: [Statement] = self.parse(try json["statementList"].rawData())
                        print("Total",statements.count)
                        completionHandler { return statements }
                    } catch {
                        completionHandler { return [] }
                    }
                }
        }
    }
    
    private func parse<T:Decodable>(_ data: Data, as type:T.Type = T.self) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse JSON as \(T.self):\n\(error)")
        }
    }
    
}

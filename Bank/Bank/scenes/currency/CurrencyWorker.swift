//
//  CurrencyWorker.swift
//  Bank
//
//  Created by Thiago Lima on 19/01/19.
//  Copyright (c) 2019 SantanderTecnologia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire

typealias currencyResponseHandler = (_ response:Currency.Response) ->()

class CurrencyWorker {
    
    func fetchStatements(userId:Int!, responseRequest:@escaping(currencyResponseHandler)) {
        if verificaInternet() {
            Alamofire.request(Endpoints.Bank.Statements.url + "\(userId)").validate(contentType: ["application/json"]).responseJSON { dataResponse in
                switch dataResponse.result {
                    case .success(let json):
                        let response = json as! NSDictionary
                        let list = response.object(forKey: "statementList") as! NSArray
                        let statementList = NSMutableArray()
                        for i in 0 ..< list.count {
                            let statement = Currency.Statement(list.object(at: i) as! [String : Any])
                            statementList.add(statement)
                        }
                        responseRequest(Currency.Response(statements: statementList,
                                                          error: nil))
                        break
                    case .failure( _):
                        responseRequest(Currency.Response(statements: nil,
                                                          error:Currency.Error(code: 0, message: "Ops! Ocorreu um erro ao contatar o servidor. Tente mais tarde.")))
                        break
                }
            }
        }else {
            responseRequest(Currency.Response(statements: nil,
                                              error:Currency.Error(code: 0, message: "Sem conexão com a internet.")))
        }
    }
    
}

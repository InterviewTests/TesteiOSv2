//
//  StatementService.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

class StatementService: NSObject {
    class func getStatements(userId:String) ->  RxSwift.Observable<[Statement]> {
        
     
        let url = Routes.getStatements(id:userId)
        
        return RxSwift.Observable<[Statement]>.create({ (observer) -> Disposable in
            ServiceManager.defaultClient.request(url,method: .get,
                                                 parameters:nil,
                                                 encoding:JSONEncoding(),
                                                 headers:nil)
                .validate(statusCode: 200...399)
                .responseJSON(completionHandler: { (response) in
                    if let dict = response.result.value as? [String: Any],
                        let dataList = dict["statementList"] as? [[String: Any]] {
                        let statements = dataList.compactMap {
                            return Mapper<Statement>().map(JSON: $0)
                        }
                        observer.onNext(statements)
                        observer.onCompleted()
                    } else {
                        observer.onError(NSError(domain: "br.testeIOS",
                                                 code: 20,
                                                 userInfo: ["message": "Erro a carrega informações!"]))
                    }
                    
                    return observer.onCompleted()
                })
            
            return Disposables.create()
        })
    }
}

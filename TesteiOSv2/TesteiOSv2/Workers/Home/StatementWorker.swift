//
//  HomeWorker.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class StatementWorker {
    //MARK: Get Statements
    class func getStatements(userId: String, completion:  @escaping (_ statements:[Statement]?, _ error: String?) -> Void) {
        _ = StatementService.getStatements(userId:userId).subscribe(onNext: { (statements) in
            completion(statements, nil)
        }, onError: { (error) in
            completion(nil, error.message())
        }, onCompleted: nil, onDisposed: nil)
    }
}

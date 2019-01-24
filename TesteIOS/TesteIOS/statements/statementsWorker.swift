//
//  statementsWorker.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class statementsWorker {
    func getStatments(request: statements.get.Request, callback: @escaping (_ request: statements.get.Response?) -> Void) {
        RestApi.GetStatments(id: String(request.userAccount?.userId ?? 0)) {
            response in
            let response = statements.get.Response(userAccount: request.userAccount, statments: response?.statmentList)
            callback(response)
        }
    }
}

//
//  StatementsWorker.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import Foundation

class StatementsWorker {
    var statementsStore: StatementsStoreProtocol
    
    init(statementsStore: StatementsStoreProtocol) {
        self.statementsStore = statementsStore
    }
    
    func getStatements(completionHandler: @escaping ([Statement]?) -> Void) {
        self.statementsStore.getStatements() { (statements: [Statement]?) -> Void in
            DispatchQueue.main.async {
                completionHandler(statements)
            }
        }
    }
}

protocol StatementsStoreProtocol {
    func getStatements(completionHandler: @escaping ([Statement]?) -> Void)
}

//
//  StatementWorker.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

protocol StatementWorkerProtocol {
    func getStatements(userId: Int, completion: @escaping([Statement]?, BankError?) -> Void) throws
}

class StatementWorker: BankWorker, StatementWorkerProtocol {    
    func getStatements(userId: Int, completion: @escaping([Statement]?, BankError?) -> Void) throws {
        try! bankStore.getStatements(userId: userId) { (user, error) in
            if(error != nil)
            {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                
            }
            else
            {
                DispatchQueue.main.async {
                    completion(user, nil)
                }
            }
        }
    }
}

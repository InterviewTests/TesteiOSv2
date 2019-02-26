//
//  BankWorker.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

class BankWorker {
    var bankStore: BankStoreProtocol
    
    init(bankStore: BankStoreProtocol) {
        self.bankStore = bankStore
    }
    
    func authenticate(user: String, password: String, completion: @escaping(User?, BankError?) -> Void) {
        try! bankStore.authenticate(user: user, password: password) { (user, error) in
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

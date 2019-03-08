//
//  BankWorker.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

protocol BankWorkerProtocol {
    
}

class BankWorker: BankWorkerProtocol {
    var bankStore: BankStoreProtocol
    
    init(bankStore: BankStoreProtocol) {
        self.bankStore = bankStore
    }
}

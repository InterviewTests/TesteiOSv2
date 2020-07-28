//
//  UserAccount.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 26/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import Foundation

struct UserAccount {
    var userId: NSNumber?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: NSNumber?

    init(id: NSNumber, name: String, bankAccount: String, agency: String, balance: NSNumber) {
        self.userId = id
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}

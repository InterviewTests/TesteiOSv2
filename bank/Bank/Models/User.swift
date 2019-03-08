//
//  User.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

struct User: Codable, Equatable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    init(userId: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userId == rhs.userId &&
        lhs.name == rhs.name &&
        lhs.bankAccount == rhs.bankAccount &&
        lhs.agency == rhs.agency &&
        lhs.balance == rhs.balance
    }
    
}

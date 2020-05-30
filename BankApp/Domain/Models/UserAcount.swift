//
//  UserAccount.swift
//  Domain
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct UserAccount: BaseModel {
    public let userID: Int
    public let name: String
    public let bankAccount: String
    public let agency: String
    public let balance: Double
    
    public init(userID: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userID = userID
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}

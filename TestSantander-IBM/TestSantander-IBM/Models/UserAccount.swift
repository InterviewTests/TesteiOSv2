//
//  UserAccount.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

struct UserAccount: Decodable {
    
    let userId: Int
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Float?
    let userName: String?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case bankAccount
        case agency
        case balance
        case userName
    }
    
    init(userId: Int, name: String? = nil, bankAccount: String? = nil, agency: String? = nil, balance: Float? = nil, userName: String? = nil) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
        self.userName = userName
    }
}

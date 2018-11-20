//
//  User.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

struct User: Decodable {
    let userId: Int?
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
    
    init(userId: Int?, name: String? = nil, bankAccount: String? = nil, agency: String? = nil, balance: Float? = nil, userName: String? = nil) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
        self.userName = userName
    }
}

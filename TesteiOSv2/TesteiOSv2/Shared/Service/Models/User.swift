//
//  User.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?

    private enum CodingKeys : String, CodingKey {
        case userId = "userId"
        case name = "name"
        case bankAccount = "bankAccount"
        case agency = "agency"
        case balance = "balance"
    }
}

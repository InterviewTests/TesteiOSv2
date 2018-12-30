//
//  UserHistory.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

struct UserAccount: UserAccountable, Decodable {
    
    var userId: String?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name = "name"
        case bankAccount = "bank_account"
        case agency = "agency"
        case balance = "balance"
    }
}

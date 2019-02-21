//
//  UserHistory.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

struct UserAccount: UserAccountable, Decodable {
    
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case name = "name"
        case bankAccount = "bankAccount"
        case agency = "agency"
        case balance = "balance"
    }
}

extension UserAccount {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        bankAccount = try values.decodeIfPresent(String.self, forKey: .bankAccount)
        agency = try values.decodeIfPresent(String.self, forKey: .agency)?.toBankAgency()
        balance = try values.decodeIfPresent(Double.self, forKey: .balance)
    }
}

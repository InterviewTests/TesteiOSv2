//
//  UserAccount.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 05/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import ObjectMapper

class UserAccount: Mappable {
    
    var userId: Int = 0
    var name: String = ""
    var bankAccount: String = ""
    var agency: String = ""
    var balance: Double = 0
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        userId      <- map["userId"]
        name        <- map["name"]
        bankAccount <- map["bankAccount"]
        agency      <- map["agency"]
        balance     <- map["balance"]
    }
}

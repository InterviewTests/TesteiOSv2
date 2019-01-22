//
//  User.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import ObjectMapper

class UserAccount: Mappable {
    var user: [User]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        user <- map["userAccount"]
    }
}

class User: Mappable {
    
    var userId: Int?
    var name: String?
    var bankAccount: Int?
    var agency: Int?
    var balance: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        name <- map["name"]
        bankAccount <- map["bankAccount"]
        agency <- map["agency"]
        balance <- map["balance"]
    }
}


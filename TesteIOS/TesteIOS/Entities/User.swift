//
//  User.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import ObjectMapper

class User : Mappable {
    var userAccount: UserAccount?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        userAccount <- map["userAccount"]
    }
}

class UserAccount: Mappable {
    
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
    
    func validUserAccount() -> Bool
    {
        return (userId != nil)
    }
    
    func print() -> String{
        let ret = "UserAccount: userid=\(userId), name=\(name), bankAccount=\(bankAccount)"
        return ret
    }
    
}


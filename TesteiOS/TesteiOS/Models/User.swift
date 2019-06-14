//
//  User.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var userAccount: UserAccount?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        userAccount <- map["userAccount"]
    }
}

class UserAccount: Mappable {
    @objc dynamic var userId: Int = -1
    @objc dynamic var name: String?
    @objc dynamic var bankAccount: String?
    @objc dynamic var agency: String?
    @objc dynamic var balance: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        let transform = TransformOf<String, Double>(fromJSON: { (value: Double?) -> String? in
            
            if let v = value {
                return v.changeCurrency()
            }
            return nil
        }, toJSON: { (value: String?) -> Double? in
            if let value = value {
                return Double(value)
            }
            return nil
        })
        
        userId <- map["userId"]
        name <- map["name"]
        bankAccount <- map["bankAccount"]
        agency <- map["agency"]
        balance <- (map["balance"], transform)
    }
}

//
//  User.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import  ObjectMapper
class User: Mappable {
    var userId: Int?
    var name : String?
    var bankAccount : String?
    var agency : String?
    var balance : Double?
    var username:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        name <- map["name"]
        bankAccount <- map["bankAccount"]
        agency <- map["agency"]
        balance <- map["balance"]
    }
    
}

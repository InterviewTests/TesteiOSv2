//
//  UserAccount.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit
import ObjectMapper

class UserAccount: Mappable {

    var userId: Int?
    var name : String?
    var bankAccount : String?
    var agency : String?
    var balance : Double?
        
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

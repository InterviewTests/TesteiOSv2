//
//  UserResponse.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit
import ObjectMapper

class UserResponse: Mappable {
    
    
    var userAccount : UserAccount?
    var error : ResponseError?
    
    init(account : UserAccount, error : ResponseError)
    {
        self.userAccount = account
        self.error = error
    }
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        userAccount <- map["userAccount"]
        error <- map["error"]
    }

    
}

//
//  AccountBalance.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit
import ObjectMapper

class AccountBalance: Mappable {
    
    var statementList : [Registry]?
    var error : ResponseError?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        statementList <- map["statementList"]
        error <- map["error"]

    }
    
    
}

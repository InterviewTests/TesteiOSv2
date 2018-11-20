//
//  StatementList.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import  ObjectMapper
class StatementList: Mappable {
    var statementList : [Statement]?
    var error : String?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        statementList <- map["statementList"]
        error <- map["error"]
    }
}

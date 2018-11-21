//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import ObjectMapper

class Statement: Mappable {
    var title : String?
    var description : String?
    var date : String?
    var value : Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        description <- map["desc"]
        date <- (map["date"])
        value <- map["value"]
    }
}

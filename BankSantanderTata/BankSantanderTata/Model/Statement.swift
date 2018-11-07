//
//  Statement.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 05/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import ObjectMapper

class Statement: Mappable {
    
    var title: String = ""
    var desc: String = ""
    var date: String = ""
    var value: Double = 0
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title       <- map["title"]
        desc        <- map["desc"]
        date        <- map["date"]
        value       <- map["value"]
        
    }
}

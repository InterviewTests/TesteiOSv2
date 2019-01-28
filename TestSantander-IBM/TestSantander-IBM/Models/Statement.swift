//
//  Statement.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 25/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import Foundation
import ObjectMapper

struct Statement: Mappable {
    
    var title: String?
    var desc: String?
    var date: String?
    var value: Float?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.title <- map["title"]
        self.desc <- map["desc"]
        self.date <- map["date"]
        self.value <- map["value"]
    }
}

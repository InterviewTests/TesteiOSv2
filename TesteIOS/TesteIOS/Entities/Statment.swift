//
//  Statment.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import ObjectMapper

class Statments: Mappable {
    var statmentList: [Statment]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        statmentList <- map["statementList"]
    }
}

class Statment: Mappable {
    
    var title: String?
    var desc: String?
    var data: String?
    var value: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        desc <- map["desc"]
        data <- map["data"]
        value <- map["value"]
    }
}

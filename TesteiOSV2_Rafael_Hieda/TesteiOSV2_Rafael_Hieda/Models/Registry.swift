//
//  Registry.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit
import ObjectMapper

class Registry: Mappable {
    
    var title : String?
    var description : String?
    var date : String?
    var value : Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        description <- map["desc"]
        date <- map["date"]
        value <- map["value"]
        
    }
    
}

//
//  Registry.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

class Registry: NSObject {
    var title : String
    var desc : String
    var date : String
    var value : Decimal
    
    init(_ title : String, _ desc : String, _ date: String, _ value : Decimal)
    {
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
    }
    
}

//
//  HTTPHeaderMethod.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum RequestHeaderMethod: String{
    case json = "application/json"
    
    var description: String {
        return self.rawValue
    }
}

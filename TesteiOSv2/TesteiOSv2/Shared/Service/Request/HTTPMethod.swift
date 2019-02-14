//
//  HTTPMethod.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum HttpMethod: String{
    
    case GET = "GET"
    case POST = "POST"
    
    var description: String {
        return self.rawValue
    }
}

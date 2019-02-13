//
//  ServicePaths.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum HTTPServicePaths:String {
    case BASE_URL = "https://bank-app-test.herokuapp.com"
    case LOGIN_PATH = "/api/login"
    case STATEMENTS_PATH = "/api/statements/1"
    
    var description: String {
        return self.rawValue
    }
}

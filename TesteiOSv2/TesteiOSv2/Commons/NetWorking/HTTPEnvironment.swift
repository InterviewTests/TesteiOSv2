//
//  HTTPEnvironment.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

enum HTTPEnvironment {
    case dev
    
    public var host : String {
            return "https://bank-app-test.herokuapp.com/api/"
    }
}

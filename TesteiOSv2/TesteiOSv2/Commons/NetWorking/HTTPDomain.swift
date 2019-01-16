//
//  HTTPDomain.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

protocol HTTPDomain {
    var environment : HTTPEnvironment { get }
}

extension HTTPDomain {
    
    var environment : HTTPEnvironment {
        return .dev
    }
}

//
//  User.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

struct UserLogin: Encodable {
    
    var user: String?
    var password: String?
    
    enum CodingKeys: String, CodingKey {
        case user
        case password
    }
}

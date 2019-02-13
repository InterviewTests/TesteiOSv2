//
//  UserModel.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 12/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    
    var user: User?
    var error : ErrorModel?
    
    private enum CodingKeys : String, CodingKey {
        case user = "userAccount"
        case error = "error"
    }
}

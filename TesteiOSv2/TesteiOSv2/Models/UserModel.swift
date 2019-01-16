//
//  UserModel.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    var userAccount: UserAcount?
    var error : ErrorModel?
    
    private enum CodingKeys : String, CodingKey {
        case userAccount = "userAccount"
        case error = "error"
    }
}

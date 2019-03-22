//
//  userModel.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation


struct UserModel: Codable {
    let userAccount: UserAccount
    let error: Error
}
class UserAccount: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

class Error: Codable{
}

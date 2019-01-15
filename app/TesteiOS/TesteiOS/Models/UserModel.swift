//
//  UserModel.swift
//  TesteiOS
//
//  Created by Emerson Pereira on 15/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    let userAccount: UserAccount!
    let error: UserError!
}

struct UserAccount: Codable {
    let userId: Int!
    let name: String!
    let bankAccount: String!
    let agency: String!
    let balance: Double!
}

struct UserError: Codable {
    let code: Int!
    let message: String!
}

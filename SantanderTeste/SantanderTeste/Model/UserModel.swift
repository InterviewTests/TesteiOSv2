//
//  userModel.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation


struct UserModel: Codable{
    let userAccount: userAccount
    let error: erro
}
class userAccount: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

class erro: Codable{
}

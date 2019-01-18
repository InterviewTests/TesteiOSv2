//
//  UserAccountModel.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 11/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

struct UserModel: Decodable {
    let userAccount: UserAccountModel?
    let error: ErrorModel?
}

struct UserAccountModel: Decodable {
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
}

struct ErrorModel: Decodable {
    let message: String?
    let code: Int?
}

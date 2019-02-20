//
//  LoginResponse.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
    let userAccount: UserAccount
    let error: ErrorResponse
}

struct UserAccount: Decodable {
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
}
//{
//    "userAccount": {
//        "userId": 1,
//        "name": "Jose da Silva Teste",
//        "bankAccount": "2050",
//        "agency": "012314564",
//        "balance": 3.3445
//    },
//    "error": {}
//}

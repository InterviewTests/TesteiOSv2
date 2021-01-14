//
//  LoginEntities.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

struct LoginForm: Encodable {
    var username: String
    var password: String
}

struct LoginResponseStruct: Decodable {
    let userAccount: LoggedinUserStruct
    //let error: {}
}

struct LoggedinUserStruct: Decodable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Float
}

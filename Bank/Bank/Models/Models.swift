//
//  Models.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

struct UserLogin: BankCodable {
    var userAccount: UserAccount?
    var error: ErrorHandler?
}

struct User: BankCodable {
    var user: String?
    var password: String?
}

struct UserAccount: BankCodable {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

struct StatementList: BankCodable {
    var statementList: [Statement]?
    var error: ErrorHandler?
}

struct Statement: BankCodable {
    var title: String
    var desc: String
    var date: String
    var value: Double
}

struct UserId: BankCodable {
    var userId: String
}

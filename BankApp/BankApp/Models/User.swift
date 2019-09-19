//
//  User.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

struct User: Decodable {
    var userId: Int
    var login: String? //Digitado pelo usuario
    var password: String? //Digitado pelo usuario
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

//
//  User.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

struct User: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

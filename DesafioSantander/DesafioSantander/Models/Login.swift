//
//  UserAccount.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

/*
 
 {
 "userAccount": {
 "userId": 1,
 "name": "Jose da Silva Teste",
 "bankAccount": "2050",
 "agency": "012314564",
 "balance": 3.3445
 },
 "error": {}
 }
 
 */

struct Login: Codable {
    var userAccount: UserAccount?
}

struct UserAccount: Codable {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
}

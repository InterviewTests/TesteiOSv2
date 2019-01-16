//
//  UserAccount.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 13/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation


struct UserAcount : Codable {
    let userId : Int?
    let name : String?
    let bankAccount : String?
    let agency : String?
    let balance : Float?
    
    private enum CodingKeys : String, CodingKey {
        case userId = "userId"
        case name = "name"
        case bankAccount = "bankAccount"
        case agency = "agency"
        case balance = "balance"
    }
}

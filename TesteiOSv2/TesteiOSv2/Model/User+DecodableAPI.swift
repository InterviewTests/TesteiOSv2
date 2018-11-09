//
//  User+DecodableAPI.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

extension User {
    enum CodingKeys: String, CodingKey {
        case userAccount
    }
    
    enum ContainerInfo: String, CodingKey {
        case userId
        case name
        case bankAccount
        case agency
        case balance
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let userInfo = try values.nestedContainer(keyedBy: ContainerInfo.self, forKey: .userAccount)
        
        bankAccount = try userInfo.decode(String.self, forKey: .bankAccount)
        userId = try userInfo.decode(Int.self, forKey: .userId)
        name = try userInfo.decode(String.self, forKey: .name)
        agency = try userInfo.decode(String.self, forKey: .agency)
        balance = try userInfo.decode(Double.self, forKey: .balance)
    }
}

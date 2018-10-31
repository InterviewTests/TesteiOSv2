//
//  UserInfo.swift
//  TesteiOSv2
//
//  Created by Alexandre Gabassi on 29/10/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import Foundation

struct UserInfo: Equatable
{
    var userId  : String?
    var name    : String?
    var bankAccount : String?
    var agency : String?
    var balance : Float32?

    static func ==(lhs: UserInfo, rhs: UserInfo) -> Bool
    {
        return lhs.userId == rhs.userId
            && lhs.name == rhs.name
            && lhs.bankAccount == rhs.bankAccount
            && lhs.agency == rhs.agency
            && lhs.balance == rhs.balance
    }
}

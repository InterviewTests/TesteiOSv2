//
//  UserAccount.swift
//  bankibm
//
//  Created by Alexandre Furquim on 02/11/18.
//  Copyright © 2018 Alexandre Furquim. All rights reserved.
//

import Foundation

struct UserAccount: Equatable
{
    var userId  : String?
    var name    : String?
    var bankAccount : String?
    var agency : String?
    var balance : Float32?
    
    static func ==(lhs: UserAccount, rhs: UserAccount) -> Bool
    {
        return lhs.userId == rhs.userId
            && lhs.name == rhs.name
            && lhs.bankAccount == rhs.bankAccount
            && lhs.agency == rhs.agency
            && lhs.balance == rhs.balance
    }
}

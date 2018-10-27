//
//  UserAccount.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

class UserAccount: NSObject {

    var userId: Int
    var name : String
    var bankAccount : String
    var agency : String
    var balance : Decimal
    
    init(_ id : Int, name : String, account: String, agency : String, balance : Decimal)
    {
        self.userId = id
        self.name = name
        self.bankAccount = account
        self.agency = agency
        self.balance = balance
    }

}

//
//  Account.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 28/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import Foundation

struct Account : Decodable {
    
    var agency : String
    var balance : Float
    var bankAccount : String
    var name : String
    var userId : Int
    var agencyConta : String {
        var numberCount = agency
        numberCount.insert(".", at: numberCount.index(numberCount.startIndex, offsetBy: 2))
        if numberCount.count >= 9 {
            numberCount.insert("-", at: numberCount.index(numberCount.startIndex, offsetBy: 9))
        }
        return "\(bankAccount) / \(numberCount)"
    }
}

struct ResponseAccount : Decodable {
    var userAccount : Account
}

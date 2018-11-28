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
}

struct ResponseAccount : Decodable {
    var userAccount : Account
}

//
//  User.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import Foundation

struct User : Equatable {
    
    // MARK: User Account
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double

    init(_ dic: [String:NSObject]) {
        self.userId         = dic["userId"] as? Int ?? 0
        self.name           = dic["name"] as? String ?? ""
        self.bankAccount    = dic["bankAccount"] as? String ?? ""
        self.agency         = dic["agency"] as? String ?? ""
        self.balance        = dic["balance"] as? Double ?? 0
    }
}

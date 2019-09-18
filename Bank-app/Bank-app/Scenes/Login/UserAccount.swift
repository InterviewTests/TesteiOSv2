//
//  UserAccount.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 16/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation

class UserAccount: Decodable {
    var userAccount: UserInfo
}

class UserInfo: Decodable {
    var userId: Int = 0
    var name: String = ""
    var bankAccount: String = ""
    var agency: String = ""
    var balance: Double = 0.00
}

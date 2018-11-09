//
//  User.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

struct User: Decodable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

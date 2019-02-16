//
//  UserAccount.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct UserAccount: Decodable {
  let userId: Int
  let name: String
  let bankAccount: String
  let agency: String
  let balance: Double
}

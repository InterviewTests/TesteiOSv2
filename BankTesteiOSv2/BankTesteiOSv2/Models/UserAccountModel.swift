//
//  loginModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

struct UserAccount: Decodable
{
      let userId: Int
      let name: String
      let bankAccount: String
      let agency: String
      let balance: Double
      
      enum CodingKeys: String, CodingKey
      {
            case userId = "userId"
            case name = "name"
            case bankAccount = "bankAccount"
            case agency = "agency"
            case balance = "balance"
      }
      
}

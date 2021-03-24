//
//  UserAccountErrorModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

struct UserAccountError: Decodable
{
      let code: Int = 0
      let message: String = ""
      
      enum CodingKeys: String, CodingKey
      {
            case code = "code"
            case message = "message"
      }
      
}

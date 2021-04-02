//
//  UserStatementModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

struct UserStatementList: Codable
{
      let title: String
      let desc: String
      let date: String
      let value: Double
      
      enum CodingKeys: String, CodingKey
      {
            case title = "title"
            case desc = "desc"
            case date = "date"
            case value = "value"
      }
}

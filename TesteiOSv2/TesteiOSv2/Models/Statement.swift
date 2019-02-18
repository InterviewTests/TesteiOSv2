//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct Statement: Decodable {
  let title: String
  let description: String
  let date: Date
  let value: Double

  enum CodingKeys: String, CodingKey {
    case title, date, value
    case description = "desc"
  }
}

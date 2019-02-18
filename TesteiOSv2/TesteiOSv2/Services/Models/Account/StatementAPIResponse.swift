//
//  StatementAPIResponse.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct StatementAPIResponse: Decodable {
  let statements: [Statement]

  enum CodingKeys: String, CodingKey {
    case statements = "statementList"
  }
}

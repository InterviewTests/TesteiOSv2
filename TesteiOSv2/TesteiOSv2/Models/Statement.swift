//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 13/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct Statement {
  let title: String?
  let description: String?
  let date: String?
  let value: Double?
}

extension Statement: Decodable {
  enum StatementCodingKeys: String, CodingKey {
    case title
    case description = "desc"
    case date
    case value
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: StatementCodingKeys.self)
    
    title = try container.decode(String.self, forKey: .title)
    description = try container.decode(String.self, forKey: .description)
    date = try container.decode(String.self, forKey: .date)
    value = try container.decode(Double.self, forKey: .value)
  }
  
}

struct StatementList {
  let statements: [Statement]?
  let error: Error?
}

extension StatementList: Decodable {
  enum StatementListCodingKeys: String, CodingKey {
    case statements = "statementList"
    case error
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: StatementListCodingKeys.self)
    if container.contains(.statements) {
      statements = try container.decode([Statement].self, forKey: .statements)
      error = nil
    } else {
      statements = nil
      error = try container.decode(Error.self, forKey: .error)
    }
  }
}

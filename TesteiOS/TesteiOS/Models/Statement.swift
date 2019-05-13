//
//  Statements.swift
//  TesteiOS
//
//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

struct Statement: Codable {
  let statementList: [StatementList]?
  let error: Error?
}

struct Error: Codable { }

struct StatementList: Codable {
  var title: String?
  var accountName: String?
  var date: String?
  var accountValue: Double?
  
  private enum CodingKeys: String, CodingKey {
    case title = "title"
    case accountName = "desc"
    case date = "date"
    case accountValue = "value"
  }
}

extension Statement {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    statementList = try? container.decode([StatementList].self, forKey: .statementList)
    error = try? container.decode(Error.self, forKey: .error)

  }

  static func parse(_ data: Data) -> Statement? {
    var statement: Statement?

    do {
      statement = try JSONDecoder().decode(Statement.self, from: data)
    } catch let jsonErr {
      print("Error decoding Json", jsonErr)
    }
    return statement
  }
}

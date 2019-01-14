//
//  User.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 11/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct User {
  let id: Int?
  let name: String?
  let bankAccount: String?
  let agency: String?
  let balance: Double?
}

extension User: Decodable {
  enum UserCodingKeys: String, CodingKey {
    case id = "userId"
    case name
    case bankAccount
    case agency
    case balance
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserCodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    bankAccount = try container.decode(String.self, forKey: .bankAccount)
    agency = try container.decode(String.self, forKey: .agency)
    balance = try container.decode(Double.self, forKey: .balance)
  }
}

struct Error: Swift.Error {
  let code: Int?
  let message: String?
}

extension Error: Decodable {
  enum ErrorCondingKeys: String, CodingKey {
    case code
    case message
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ErrorCondingKeys.self)
    
    code = try container.decode(Int.self, forKey: .code)
    message = try container.decode(String.self, forKey: .message)
  }
}

struct UserAccount {
  let user: User?
  let error: Error?
}

extension UserAccount: Decodable {
  enum UserAccountCodingKeys: String, CodingKey {
    case user = "userAccount"
    case error = "error"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserAccountCodingKeys.self)
    
    if container.contains(.user) {
      user  = try container.decode(User.self, forKey: .user)
      error = nil
    } else {
      user = nil
      error = try container.decode(Error.self, forKey: .error)
    }
  }
}





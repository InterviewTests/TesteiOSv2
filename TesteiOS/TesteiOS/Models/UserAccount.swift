//
//  UserAccount.swift
//  TesteiOS
//
//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

struct UserAccount: Codable {
  let userAccount: AccountDetail?
  let error: LoginError?
}

struct AccountDetail: Codable {
  let userId: Int?
  let name: String?
  let bankAccount: String?
  let agency: String?
  let balance: Double?
}

struct LoginError: Codable { }

extension UserAccount {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    userAccount = try? container.decode(AccountDetail.self, forKey: .userAccount)
    error = try? container.decode(LoginError.self, forKey: .error)
  }
  
  static func parse(_ data: Data) -> UserAccount? {
    var userAccount: UserAccount?
    
    do {
      userAccount = try JSONDecoder().decode(UserAccount.self, from: data)
    } catch let jsonErr {
      print("Error decoding Json", jsonErr)
    }
    return userAccount
  }
}

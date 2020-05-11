//
//  UserApi.swift
//  TesteSantader
//
//  Created by Bruno Chen on 07/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

// MARK: - User info

struct UserData: Codable, Equatable {
    let userAccount: UserAccount
    let error: ErrorUserAPI
}

// MARK: - Error
struct ErrorUserAPI: Codable, Equatable {
}

// MARK: - UserAccount
struct UserAccount: Codable,Equatable {
    let userID: Int
    let name, bankAccount, agency: String
    let balance: Double

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}

func ==(lhs: UserData, rhs: UserData) -> Bool
{
  return lhs.userAccount == rhs.userAccount
    && lhs.error == rhs.error
}

func ==(lhs: UserAccount, rhs: UserAccount) -> Bool
{
  return lhs.userID == rhs.userID
    && lhs.name == rhs.name
    && lhs.bankAccount == rhs.bankAccount
    && lhs.agency == rhs.agency
}

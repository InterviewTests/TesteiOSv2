//
//  UserAccountModel.swift
//  Domain
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation


public struct UserAccountModel: BaseModel {
    public let userAccount: UserAccount
    public var authError: AuthError

    public init(userAccount: UserAccount, authError: AuthError) {
        self.userAccount = userAccount
        self.authError = authError
    }
    
    public static func == (lhs: UserAccountModel, rhs: UserAccountModel) -> Bool {
        return lhs.userAccount.userID == rhs.userAccount.userID
    }
    
    enum CodingKeys: String, CodingKey {
        case authError = "error"
        case userAccount
    }
}

public struct UserAccount: Codable, Equatable {
    public var userID: Int?
    public let name: String?
    public let bankAccount: String?
    public let agency: String?
    public let balance: Double?
    
    public init(userID: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userID = userID
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}

public struct AuthError: Codable {
    public var code: Int?
    public var message: String?
    
    public init(code: Int? = nil, message: String? = nil) {
        self.code = code
        self.message = message
    }
}

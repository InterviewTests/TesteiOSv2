//
//  LoginModels.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

enum Login {
    // MARK: Use cases
    
    struct Request {
        var user: String
        var password: String
    }
    struct Response: Decodable {
        let userAccount: UserAccount?
        let error: ResultError?
    }
    struct ViewModel {
        let userID: Int
        let name: String
        let account: String
        let balance: String
        let errorMsg: String?
        
        init(user: UserAccount? = nil, error: ResultError? = nil) {
            userID = user?.userID ?? 0
            name = user?.name ?? ""
            account = "\(user?.agency ?? "0") / \(user?.bankAccount ?? "0")"
            balance = user?.balance?.convertToCurrency() ?? "-"
            errorMsg = error?.message
        }
    }
}

struct UserAccount: Decodable {
    let userID: Int?
    let name, bankAccount, agency: String?
    let balance: Double?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}

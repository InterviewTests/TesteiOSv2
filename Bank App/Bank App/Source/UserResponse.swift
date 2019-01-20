//
//  UserResponse.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 30/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

struct UserResponse {
    
    let userAccount: UserAccount?
    let error: BankError?
    
    enum CodingKeys: String, CodingKey {
        case userAccount
        case error
    }
}

extension UserResponse: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userAccount = try values.decodeIfPresent(UserAccount.self, forKey: .userAccount)
        error = try values.decodeIfPresent(BankError.self, forKey: .error)
    }
}

//
//  UserAccountFactory.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Domain

var userAccountModel: UserAccountResponse {
    return .init(userAccount: UserAccountResponse(userID: 1, name: "name_any", bankAccount: "bankAccount_any", agency: "agency_any", balance: 0.0), authError: AuthError())
}

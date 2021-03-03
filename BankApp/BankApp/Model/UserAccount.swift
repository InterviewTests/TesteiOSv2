//
//  UserLogin.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 03/03/21.
//

import Foundation

struct UserAccount {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    
    init(from userAccountData: UserLoginData.UserAccountData) {
        self.userId = userAccountData.userId!
        self.name = userAccountData.name!
        self.bankAccount = userAccountData.bankAccount!
        self.agency = userAccountData.agency!
        self.balance = userAccountData.balance!
    }
}

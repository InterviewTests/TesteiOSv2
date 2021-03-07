//
//  UserAccount.swift
//  BankApp
//  Struct model, that represent all user account's data and is made from data received from post request if the user exists. It implements the protocol FetchedData.
//
//  Created by Adriano Rodrigues Vieira on 03/03/21.
//

import Foundation

struct UserAccount: FetchableData {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
        
    /// Creates an UserAccount based on data fetched from POST request
    /// - parameter userAccountData: an UserAccountData object
    init(from userAccountData: UserLoginData.UserAccountData) {
        self.userId = userAccountData.userId!
        self.name = userAccountData.name!
        self.bankAccount = userAccountData.bankAccount!
        self.agency = userAccountData.agency!
        self.balance = userAccountData.balance!
    }
}

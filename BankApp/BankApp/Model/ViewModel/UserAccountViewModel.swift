//
//  UserAccountViewModel.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct UserAccountViewModel {
    let userName: String
    let accountWithAgency: String
    let amount: String

    init(from userAccount: UserAccount) {
        self.userName = userAccount.name
        self.accountWithAgency = Self.createFormattedAccountWithAgencyString(account: userAccount.bankAccount, agency: userAccount.agency)
        self.amount = CurrencyConverter.convertUSNumberValueToBRStringValue(userAccount.balance)
    }
    
    
    
    private static func createFormattedAccountWithAgencyString(account: String,
                                                               agency: String) -> String {
        let accountPrefix = account.prefix(2)
        let accountMiddle = account.suffix(7).prefix(6)
        let accountDigit = account.suffix(1)
        
        return "\(agency) / \(accountPrefix).\(accountMiddle)-\(accountDigit)"        
    }
}

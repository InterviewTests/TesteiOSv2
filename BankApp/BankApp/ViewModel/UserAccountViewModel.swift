//
//  UserAccountViewModel.swift
//  BankApp
//  Adapt the result of POST request (the informations of each user aka. bank account, agency and amount ) for to show properly in view - For example, the request returns two numbers (one for agency and one for account), and the view shows one string in format XXXX / XX.XXXXXX-X

//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct UserAccountViewModel {
    let userName: String
    let accountWithAgency: String
    let amount: String

    /// Creates an UserAccountViewModel based on UserAccount. Format all the data in order to show it correctly in view
    /// - Parameter userAccount: an object of UserAccount type.
    init(from userAccount: UserAccount) {
        self.userName = userAccount.name
        
        // Here, the API has an error (the userAccount is as agency and vice-versa). I had to do this to respect the api and do not to change the UserAccount code. 
        let switchedBankAccount = userAccount.agency
        let switchedAgency = userAccount.bankAccount
        
        self.accountWithAgency = Self.createFormattedAccountWithAgencyString(account: switchedBankAccount, agency: switchedAgency)
        let amount = CurrencyConverter.convertUSNumberValueToBRStringValue(userAccount.balance)
        self.amount = amount.replacingOccurrences(of: " ", with: "")        
    }
    
    /// Creates a string in format "aaaa / bb.bbbbbb-b" where "a" represents agency and b represents account.
    /// - Parameter account: the account of an user
    /// - Parameter agency: the agency of an user
    /// - Returns: the string in format xxxx / xx.xxxxxx-x
    private static func createFormattedAccountWithAgencyString(account: String,
                                                               agency: String) -> String {        
        let accountPrefix = account.prefix(2)
        let accountMiddle = account.suffix(7).prefix(6)
        let accountDigit = account.suffix(1)
        
        return "\(agency) / \(accountPrefix).\(accountMiddle)-\(accountDigit)"        
    }
}

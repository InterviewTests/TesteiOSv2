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
        
        // Aqui tive que inverter a ordem dos parametros, pois a API está com os dados invertidos (a agencia eh o numero menor,
        // e a conta o numero maior)
        let switchedBankAccount = userAccount.agency
        let switchedAgency = userAccount.bankAccount
        
        self.accountWithAgency = Self.createFormattedAccountWithAgencyString(account: switchedBankAccount, agency: switchedAgency)
        self.amount = "R$ \(userAccount.balance)"
    }
    
    private static func createFormattedAccountWithAgencyString(account: String,
                                                               agency: String) -> String {        
        let accountPrefix = account.prefix(2)
        let accountMiddle = account.suffix(7).prefix(6)
        let accountDigit = account.suffix(1)
        
        return "\(agency) / \(accountPrefix).\(accountMiddle)-\(accountDigit)"        
    }
}

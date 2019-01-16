//
//  AccountDetailHeaderModel.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

struct AccountDetailHeaderModel {
    let name: String
    let bankAccount : String
    let value : String
    
    init(user: UserAccount) {
        name = user.name
        bankAccount = AccountDetailHeaderModel.getBankAccountFormmater(account: user.bankAccount, agency: user.agency)
        value = AccountDetailHeaderModel.getValueFormmater(value: 13232220.05)
        
    }
    
    static func getBankAccountFormmater(account: String, agency: String) -> String{
        var bankAccount = account
        var bankAgency = agency
        bankAccount.insert(contentsOf: " / ", at: bankAccount.endIndex)
        bankAgency.insert(".", at: bankAgency.index(bankAgency.startIndex, offsetBy: 2))
        bankAgency.insert("-", at: bankAgency.index(before: bankAgency.endIndex))
        return bankAccount + bankAgency
    }
    
    static func getValueFormmater(value: Double) -> String{
        let indexes = [6,10,14,18,22,26]
        var valueString = String(format: "%.2f", value)
        for index in indexes {
            if valueString.count >= index {
                valueString.insert("-", at: valueString.index(valueString.endIndex, offsetBy: -index))
            }
        }
        let valueComma = String(valueString).split(separator: ".").joined(separator: [","])
        let valuePoint = String(valueComma).split(separator: "-").joined(separator: ["."])
        
        let finalValue = MONETARY_AMOUNT + valuePoint
        return finalValue
    }
}

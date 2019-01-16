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
    var value : String
    
    init(user: UserAccount) {
        name = user.name
        bankAccount = AccountDetailHeaderModel.getBankAccountFormmater(account: user.bankAccount, agency: user.agency)
        value = MonetaryString.getValueFormmater(value: 00.00)
        
    }
    
    static func getBankAccountFormmater(account: String, agency: String) -> String{
        var bankAccount = account
        var bankAgency = agency
        bankAccount.insert(contentsOf: " / ", at: bankAccount.endIndex)
        bankAgency.insert(".", at: bankAgency.index(bankAgency.startIndex, offsetBy: 2))
        bankAgency.insert("-", at: bankAgency.index(before: bankAgency.endIndex))
        return bankAccount + bankAgency
    }
}

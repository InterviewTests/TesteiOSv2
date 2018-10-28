//
//  UserDefaultsUtils.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static func retrieveData() -> UserAccount{
        let id = UserDefaults.standard.integer(forKey: "userId")
        let name = UserDefaults.standard.string(forKey: "name")
        let agency = UserDefaults.standard.string(forKey: "agency")
        let bankAccount = UserDefaults.standard.string(forKey: "bankAccount")
        let balance = UserDefaults.standard.float(forKey: "balance")
        let userName = UserDefaults.standard.string(forKey: "userName")
        return UserAccount(userId: id, name: name, bankAccount: bankAccount, agency: agency, balance: balance, userName: userName)
    }

    static func saveUserInUserDefaults(userAccount: UserAccount, userName:String){
        UserDefaults.standard.set(userAccount.userId, forKey: "userId")
        UserDefaults.standard.set(userAccount.agency, forKey: "agency")
        UserDefaults.standard.set(userAccount.balance, forKey: "balance")
        UserDefaults.standard.set(userAccount.bankAccount, forKey: "bankAccount")
        UserDefaults.standard.set(userAccount.name, forKey: "name")
        UserDefaults.standard.set(userName, forKey: "userName")
    }

}

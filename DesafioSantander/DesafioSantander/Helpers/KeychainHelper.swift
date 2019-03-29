//
//  KeychainHelper.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import UIKit

class KeychainHelper {
    static func saveAccount(account: UserAccount) {
        let accountItem = KeychainAccountItem(service: KeychainConfiguration.serviceName,
                                              account: "\(account.agency ?? "")\(account.bankAccount ?? "")",
                                                accessGroup: KeychainConfiguration.accessGroup)
        
        do {
            try accountItem.saveAccount(account)
        } catch {
            debugPrint("Error saving keychain - \(error)")
        }
    }
    
    static func account(agency: String, bankAccount: String) -> UserAccount? {
        let accountItem = KeychainAccountItem(service: KeychainConfiguration.serviceName,
                                                account: "\(agency)\(bankAccount)",
                                                accessGroup: KeychainConfiguration.accessGroup)
        do {
            let account = try accountItem.readAccount()
            return account
        } catch {
            debugPrint("Error reading keychain - \(error)")
            return nil
        }
    }
    
    static func removeItems(agency: String, bankAccount: String) {
        let accountItem = KeychainAccountItem(service: KeychainConfiguration.serviceName,
                                                account: "\(agency)\(bankAccount)",
                                                accessGroup: KeychainConfiguration.accessGroup)
        do {
            try accountItem.deleteItem()
        } catch {
            debugPrint("Error delete items - \(error)")
        }
        
    }
}

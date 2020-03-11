//
//  KeychainUserStore.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class KeychainUserStore: LocalUserStore {
    
    private let userKey = "usernameStoreKey"
    
    func fetchUser() -> String? {
        return KeychainWrapper.standard.string(forKey: userKey)
    }
    
    func storeUser(user: String) {
        print(KeychainWrapper.standard.set(user, forKey: userKey))
    }
    
}

//
//  KeychainWorker.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 01/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation
import KeychainSwift

class KeychainWorker: KeychainWorkerProtocol {
    
    var keychainAcess: KeychainSwift
    
    init () {
        self.keychainAcess = KeychainSwift()
    }
    
    func getUserLogin() -> UserLogin {
        let user = keychainAcess.get(UserLogin().userKeychainKey())
        let password = keychainAcess.get(UserLogin().passwordKeychainKey())
        
        return UserLogin.init(user: user, password: password)
    }
    
    func saveUserLogin(login: UserLogin) {
        guard let user = login.user else { return }
        guard let password = login.password else { return }
        
        keychainAcess.set(user, forKey: login.userKeychainKey())
        keychainAcess.set(password, forKey: login.passwordKeychainKey())
    }
    
    func deleteUser() {
        keychainAcess.delete(UserLogin().userKeychainKey())
        keychainAcess.delete(UserLogin().passwordKeychainKey())
    }
}

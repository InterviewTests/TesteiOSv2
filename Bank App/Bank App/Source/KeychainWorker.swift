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
    
    internal var loginKey = "keychain_user_login"
    internal var passwordKey = "keychain_user_password"
    
    init () {
        self.keychainAcess = KeychainSwift()
    }
    
    func getUserLogin() -> UserLogin {
        let user = keychainAcess.get(loginKey)
        let password = keychainAcess.get(passwordKey)
        
        return UserLogin.init(user: user, password: password)
    }
    
    func saveUserLogin(login: UserLogin) {
        guard let user = login.user else { return }
        guard let password = login.password else { return }
        
        keychainAcess.set(user, forKey: loginKey)
        keychainAcess.set(password, forKey: passwordKey)
    }
    
    func deleteUser() {
        keychainAcess.delete(loginKey)
        keychainAcess.delete(passwordKey)
    }
}

//
//  LocalStorageManager.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

protocol LocalStorageManagerProtocol {
    func loadLoginInfo() -> (userName: String?, password: String?)
    func setLoginInfo(userName: String, password: String)
}

class LocalStorageManager: LocalStorageManagerProtocol {
    private let userKey = "userKey"
    private let passwordKey = "passwordKey"
    
    func loadLoginInfo() -> (userName: String?, password: String?) {
        guard let user = KeychainWrapper.standard.string(forKey: userKey),
            let password = KeychainWrapper.standard.string(forKey: passwordKey) else {
            return (nil, nil)
        }
        
        return (user, password)
    }
    
    func setLoginInfo(userName: String, password: String) {
        KeychainWrapper.standard.set(userName, forKey: userKey)
        KeychainWrapper.standard.set(password, forKey: passwordKey)
    }
}

class MockLocalStorageManager: LocalStorageManagerProtocol {
    
    func loadLoginInfo() -> (userName: String?, password: String?) {
        return ("name", "password")
    }
    
    func setLoginInfo(userName: String, password: String) {}
}

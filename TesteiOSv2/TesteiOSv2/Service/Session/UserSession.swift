//
//  UserSession.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import KeychainSwift
import  ObjectMapper
class UserSession: NSObject {
    class Key {
        static let keychainPrefix: String = "br.com.testeIosV2"
        static let userData: String = "\(keychainPrefix).userData"
        static let pass: String = "\(keychainPrefix).password"
        static let username: String = "\(keychainPrefix).username"
    }
    
    static let current: UserSession = UserSession()
    var user:User?
    
    // MARK: - User
    func saveUser(user: User?) {
        guard let user = user else {
            return
        }
        
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        keychain.set(user.toJSONString()!, forKey: UserSession.Key.userData, withAccess: KeychainSwiftAccessOptions.accessibleAlwaysThisDeviceOnly)
    }
    
    func getUser() -> User? {
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        
        if let userJSON = keychain.get(UserSession.Key.userData) {
            let user = Mapper<User>().map(JSONString: userJSON)
            return user
        } else {
            return nil
        }
    }
    // MARK: - Pass
    func savePass(password: String?) {
        guard let pass = password else {
            return
        }
        
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        keychain.set(pass, forKey: UserSession.Key.pass, withAccess: KeychainSwiftAccessOptions.accessibleAlwaysThisDeviceOnly)
    }
    
    func getPass() -> String? {
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        
        if let pass = keychain.get(UserSession.Key.pass) {
            return pass
        } else {
            return nil
        }
    }
    // MARK: - Username
    func saveUsername(username: String?) {
        guard let name  = username else {
            return
        }
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        keychain.set(name, forKey: UserSession.Key.username, withAccess: KeychainSwiftAccessOptions.accessibleAlwaysThisDeviceOnly)
    }
    
    func getUsername() -> String? {
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        
        if let pass = keychain.get(UserSession.Key.username) {
            return pass
        } else {
            return nil
        }
    }
    
    func clean() {
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        keychain.clear()
    }
}

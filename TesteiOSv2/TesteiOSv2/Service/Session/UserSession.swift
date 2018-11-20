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
    }
    
    static let current: UserSession = UserSession()
    var user:User?
    
    // MARK: - Token
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
    
    
    func clean() {
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        keychain.clear()
    }
}

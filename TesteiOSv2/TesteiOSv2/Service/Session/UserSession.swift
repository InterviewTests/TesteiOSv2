//
//  UserSession.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit
import KeychainSwift
class UserSession: NSObject {
    class Key {
        static let keychainPrefix: String = "br.com.testeIosV2"
        static let userData: String = "\(keychainPrefix).userData"
    }
    
    static let current: UserSession = UserSession()
    
    
    func clean() {
        let keychain = KeychainSwift(keyPrefix: UserSession.Key.keychainPrefix)
        keychain.clear()
    }
}

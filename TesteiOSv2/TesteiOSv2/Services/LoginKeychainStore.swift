//
//  LoginKeychainStore.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 13/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import KeychainSwift

class LoginKeychainStore: LoginStoreProtocol {
  class Key {
    static let keychainPrefix: String = "br.bryos.TesteiOSv2"
    static let username: String = "\(keychainPrefix).usename"
    static let password: String = "\(keychainPrefix).password"
  }
  
  func save(username: String) {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    keychain.set(username, forKey: Key.username)
  }
  
  func save(password: String) {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    keychain.set(password, forKey: Key.password)
  }
  
  func getUsername() -> String? {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    return keychain.get(Key.username)
  }
  
  func getPassword() -> String? {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    return keychain.get(Key.password)
  }
}

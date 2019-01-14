//
//  LoginKeychainStoreSpec.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Nimble
import Quick

@testable import TesteiOSv2

class LoginKeychainStoreSpec: QuickSpec {
  
  override func spec() {
    describe ("a Login Keychain Store") {
      var keychain: LoginKeychainStore!
      beforeEach {
        keychain = LoginKeychainStore()
        keychain.deleteUsername()
        keychain.deletePassword()
      }
      it("should perform CRUD") {
        expect(keychain.getUsername()).to(beNil())
        expect(keychain.getPassword()).to(beNil())
        
        let username = "Test"
        let password = "Test"
        keychain.set(username: username)
        keychain.set(password: password)
        
        expect(keychain.getUsername()).to(be(username))
        expect(keychain.getPassword()).to(be(password))
        
        keychain.deleteUsername()
        keychain.deletePassword()
      }
    }
  }
}

//
//  KeychainTests.swift
//  SantanderSampleTests
//
//  Created by Virgilius Santos on 28/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Swinject

@testable import SantanderSample

class KeychainTests: QuickSpec {
    override func spec() {
        beforeEach {
            let _ = KeychainManager.remove(type: .user)
            let _ = KeychainManager.remove(type: .password)
        }
        it("verificando CRUD Keychain") {
            expect(KeychainManager.get(type: .user)).to(beNil())
            expect(KeychainManager.remove(type: .user)).notTo(beTrue())
            
            let newUser = "dolly"
            expect(KeychainManager.save(newUser, type: .user)).to(beTrue())
            expect(KeychainManager.get(type: .user)).to(be(newUser))
            
            expect(KeychainManager.remove(type: .user)).to(beTrue())
            expect(KeychainManager.get(type: .user)).to(beNil())
        }
    }
}

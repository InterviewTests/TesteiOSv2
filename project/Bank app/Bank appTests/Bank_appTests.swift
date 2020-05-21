//
//  Bank_appTests.swift
//  Bank appTests
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import XCTest
@testable import Bank_app

class Bank_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Keychain Tests
    func testSaveAndGetPasswordInKeychain() throws {
        let dummyPassword = "DUMMYPASSWORD"
        _ = KeychainUtils.shared.savePassword(password: dummyPassword)
        
        let passworkSaved = KeychainUtils.shared.getPassword()
        
        XCTAssertEqual(dummyPassword, passworkSaved, "password is not the same")
    }
    
    func testDeletePasswordInKeychain() throws {
        KeychainUtils.shared.deletePassword()
        
        let passworkSaved = KeychainUtils.shared.getPassword()
        
        XCTAssertEqual(nil, passworkSaved, "Password was not deleted")
    }
    
    func testSaveAndGetUsernameInKeychain() throws {
        let dummyUsername = "DUMMYUSERNAME"
        _ = KeychainUtils.shared.saveUsername(username: dummyUsername)
        
        let usernameSaved = KeychainUtils.shared.getUsername()
        
        XCTAssertEqual(dummyUsername, usernameSaved, "Username is not the same")
    }
    
    func testDeleteUsernameInKeychain() throws {
        KeychainUtils.shared.deleteUsername()
        
        let usernameSaved = KeychainUtils.shared.getUsername()
        
        XCTAssertEqual(nil, usernameSaved, "Username was not deleted")
    }
    
    


}

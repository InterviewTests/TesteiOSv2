//
//  DisplayUserTest.swift
//  BankTests
//
//  Created by Administrador on 28/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class DisplayUserTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPassword() {
        var user = Login.ViewModel.DiplayedUser(login:"usert_test",password:"test@1")
        XCTAssert(!user.isPasswordValid(), "A senha tem que ter pelo menos uma letra maiuscula")
        
        user.password = "Test1"
        XCTAssert(!user.isPasswordValid(), "A senha tem que ter pelo menos uma caracter especial")
        
        
        user.password = "@"
        XCTAssert(!user.isPasswordValid(), "A senha tem que ter pelo menos uma caracter alfanumérico")
    }

}

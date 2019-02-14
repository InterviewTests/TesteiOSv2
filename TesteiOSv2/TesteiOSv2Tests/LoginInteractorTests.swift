//
//  TesteiOSv2Tests.swift
//  TesteiOSv2Tests
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class LoginInteractorTests: XCTestCase {
    
    let loginInteractor = LoginInteractor()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailSuccessfully() {
        let email = "test@test.com"
        XCTAssert(self.loginInteractor.isValidEmail(email: email), "The e-mail is valid!!!")
    }
    
    func testEmailFailed() {
        let email = "test.com"
        XCTAssertFalse(self.loginInteractor.isValidEmail(email: email), "The e-mail is invalid!!!")
    }
    
    func testPasswordSuccessfully() {
        let password = "pA55@rd"
        XCTAssert(self.loginInteractor.isValidPassword(password: password), "The password is valid!!!")
    }
    
    func testPasswordFailed() {
        let password = "password"
        XCTAssertFalse(self.loginInteractor.isValidPassword(password: password), "The password is invalid!!!")
    }
    
    func testCPFSuccessfully() {
        let cpf = "06884461080"
        XCTAssert(self.loginInteractor.isValidCPF(cpf: cpf), "The password is valid!!!")
    }
    
    func testCPFFailed() {
        let cpf = "78635782635"
        XCTAssertFalse(self.loginInteractor.isValidCPF(cpf: cpf), "The password is invalid!!!")
    }

}

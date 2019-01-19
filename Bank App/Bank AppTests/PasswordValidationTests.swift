//
//  PasswordValidationTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class PasswordValidationTests: XCTestCase {
    
    var password: String = ""

    func testValidationValidPassword() {
        password = "Qr@12345" // Valid because have Special, Upercase, lowcase, number.
        XCTAssertEqual(password.isValidPassword(), true)
    }
    
    func testValidationBlankPassword() {
        password = ""
        XCTAssertEqual(password.isValidPassword(), false)
    }
    
    func testValidationInvalidPassword() {
        password = "qra12345"
        XCTAssertEqual(password.isValidPassword(), false)
    }
    
    func testValidationShortPassword() {
        password = "qra"
        XCTAssertEqual(password.isValidPassword(), false)
    }
}

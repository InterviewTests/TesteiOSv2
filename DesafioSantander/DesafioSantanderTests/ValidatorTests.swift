//
//  ValidatorTests.swift
//  DesafioSantanderTests
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import XCTest
@testable import DesafioSantander

class ValidatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailValidatorReturnsIsEmailFalse() {
        let email = "teste@teste"
        
        let isEmail = ValidatorHelper.isEmail(email)
        XCTAssertFalse(isEmail)
    }
    
    func testEmailValidatorReturnsIsEmailTrue() {
        let email = "teste@teste.com"
        
        let isEmail = ValidatorHelper.isEmail(email)
        XCTAssertTrue(isEmail)
    }
    
    func testCPFValidatorReturnsIsValidCPFFalse() {
        let cpf = "680.668.180-00"
        
        let isValidCPF = ValidatorHelper.isCpf(cpf)
        XCTAssertFalse(isValidCPF)
    }

    func testCPFValidatorReturnsIsValidCPFTrue() {
        let cpf = "680.668.180-84"
        
        let isValidCPF = ValidatorHelper.isCpf(cpf)
        XCTAssertTrue(isValidCPF)
    }

    func testPasswordPatternValidatorReturnsIsValidFalse() {
        let pwd = "testeABC"
        
        let isValidPassword = ValidatorHelper.password(pwd)
        XCTAssertFalse(isValidPassword)
    }
    
    func testPasswordPatternValidatorReturnsIsValidTrue() {
        let pwd = "Teste@1"
        
        let isValidPassword = ValidatorHelper.password(pwd)
        XCTAssertTrue(isValidPassword)
    }
    
}

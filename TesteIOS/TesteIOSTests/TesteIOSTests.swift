//
//  TesteIOSTests.swift
//  TesteIOSTests
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import XCTest
@testable import TesteIOS

class TesteIOSTests: XCTestCase {
    
    // Testing with valid email
    func testValidEmail(){
        let email  = "user@domain.ltv"
        XCTAssertTrue(Validator.isValidEmail(email: email))
    }
    
    // Testing with valid CPF
    func testValidCPF(){
        let cpf  = "39728922337"
        XCTAssertTrue(Validator.isValidCPF(cpf: cpf))
    }
    
    // Testing with InValid CPF
    func testInValidCPF(){
        let cpf  = "39728922330"
        XCTAssertFalse(Validator.isValidCPF(cpf: cpf))
    }
    
    // Testing with invalid email
    func testInValidEmail(){
        let email  = "user@domain"
        XCTAssertFalse(Validator.isValidEmail(email: email))
    }
    
    
}

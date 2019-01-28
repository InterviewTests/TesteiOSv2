//
//  StringExtensionTests.swift
//  TestSantander-IBMTests
//
//  Created by Renato Carvalhan on 27/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class StringExtensionTests: XCTestCase {

    func test_isValidEmail() {
        let email = "test@test.com"
        XCTAssertTrue(email.isValidEmail())
    }
    
    func test_isValidCPF() {
        // cpf was generated here https://www.4devs.com.br/gerador_de_cpf
        let cpf = "520.359.520-85"
        XCTAssertTrue(cpf.isValidCPF())
    }
    
    func test_isValidPassword() {
        let password = "Test@123"
        XCTAssertTrue(password.isValidPassword())
    }
}

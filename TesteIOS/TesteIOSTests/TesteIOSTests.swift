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
    
    func testDoubleToCurrency(){
        let double : Double = 523.2013
        let valor = "R$ 523,20"
        let toCurrency = double.toCurrency()
        XCTAssertEqual(toCurrency, valor)
    }
    
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
    
    func testLoginAPI(){
        let exp = expectation(description: "GetStatments running in the callback closure")
        RestApi.doLogin(user: "test", password: "Aabbcc11@@", callback: { userAccount in
            XCTAssertTrue(type(of: userAccount!) === UserAccount.self)
            exp.fulfill()
        }, error: {
            XCTFail("Received error from API")
        })
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectations With Timeout errored: \(error)")
            }
        }
    }
    
    func testGetStatmentsAPI(){
        let exp = expectation(description: "GetStatments running in the callback closure")
        RestApi.GetStatments(id: "1", callback: { statments in
            XCTAssertTrue(type(of: statments!) === Statments.self)
            exp.fulfill()
            
        }, error: {
            XCTFail("Received error from API")
        })
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectations With Timeout errored: \(error)")
            }
        }
    }
    
    
}

//
//  StringUtilsTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class StringUtilsTests: XCTestCase {

    func test_isValidEmail(){
        let email = "ealbizzati@gmail.com"
        let succees = String.isValidEmail(email: email)
        
        XCTAssertTrue(succees)
    }
    
    func test_isValidPassword(){
        let password = "aH&"
        let success = String.isValidPassword(pswd: password)
        XCTAssertTrue(success)
    }
    
    func test_isValidCPF(){
        let cpf = "641.434.881-32"
        let success = String.isValidCPF(cpf: cpf)
        XCTAssertTrue(success)
    }
    
    func test_FormatCurrencyLabel(){
        let str = String.formatCurrencyLabel(value: 3452.98)
        XCTAssert(str == "R$ 3452.98")
    }
    
    func test_dateFromCustomString(){
        let str = String.dateFromCustomString(customString: "2018-12-10")
        XCTAssert(str == "10/12/2018")
    }
}

//
//  StringExtensionTest.swift
//  TesteSantanderTests
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class StringExtensionTest: XCTestCase {
    
    func testIsValidRegex() {
        let email = "teste@teste.com"
        let isValid = email.isValidRegex(regex: Constants.Regex.emailRegex)
        XCTAssertTrue(isValid)
    }
    
    func testInvalidRegec() {
        let email = "teste.com"
        let isInvalid = email.isValidRegex(regex: Constants.Regex.emailRegex)
        XCTAssertFalse(isInvalid)
    }
    
    func testValidCpf() {
        let cpf = "12402629061"
        let isValid = cpf.isValidCpf()
        XCTAssertTrue(isValid)
    }
    
    func testInvalidCpf() {
        let cpf = "111111111"
        let isInvalid = cpf.isValidCpf()
        XCTAssertFalse(isInvalid)
    }
    
    func testConvertDate() {
        let date = "1987-10-11"
        let dateConverter = date.convertDataFormat()
        XCTAssertEqual(dateConverter, "11/10/1987")
    }
    
    func testDateConverterFail() {
        let date = ""
        let dateConverter = date.convertDataFormat()
        XCTAssertNil(dateConverter)
    }
    
    func testDate() {
        let stringDate = "1987-10-11"
        let date = stringDate.toDate()
        
        XCTAssertNotEqual(date, Date())
    }
}

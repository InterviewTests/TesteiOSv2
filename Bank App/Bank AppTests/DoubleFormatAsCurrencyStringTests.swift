//
//  DoubleFormatAsCurrencyStringTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class DoubleFormatAsCurrencyStringTests: XCTestCase {

    func testFormattingCreditValue() {
        let doubleValue = 200.00
        XCTAssertEqual(doubleValue.toStringCurrency(), "R$200,00")
    }
    
    func testFormattingDebtValue() {
        let doubleValue = -450.55
        XCTAssertEqual(doubleValue.toStringCurrency(), "-R$450,55")
    }
    
    func testFormattingWrongValue() {
        let doubleValue = -450.550
        XCTAssertEqual(doubleValue.toStringCurrency(), "-R$450,55")
    }
    
    func testFormattingRoundingValue() {
        let doubleValue = 1000.999
        XCTAssertEqual(doubleValue.toStringCurrency(), "R$1001,00")
    }
}

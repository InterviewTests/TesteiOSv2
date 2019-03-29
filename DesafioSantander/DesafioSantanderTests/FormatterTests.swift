//
//  FormatterTests.swift
//  DesafioSantanderTests
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import XCTest
@testable import DesafioSantander

class FormatterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBankInformationtFormatterReturnsBankInformationFormatted() {
        let agency = "1234"
        let account = "012314564"
        
        let expected = "1234 / 01.231456-4"
        
        let formatted = FormatterHelper.bankAccountFormatter(agency: agency, accountNumber: account)
        XCTAssertEqual(formatted, expected)
    }
    
    func testBalanceFormatterReturnsBalanceFormatted() {
        let balance = 100.3545
        
        let expected = "R$ 100,35"
        
        let formatted = FormatterHelper.formatCurrency(value: NSNumber(value: abs(balance)))
        XCTAssertEqual(formatted, expected)
    }
    
    func testBalanceFormatterNegativeNumbersReturnsBalanceFormatted() {
        let balance = -50
        
        let expected = "R$ 50,00"
        
        let formatted = FormatterHelper.formatCurrency(value: NSNumber(value: abs(balance)))
        print("FOrmatted", formatted)
        XCTAssertEqual(formatted, expected)
    }
    
    func testDateFormatterReturnsDateFormatted() {
        let dateString = "2018-05-20"
        
        let expected = "20/05/2018"
        
        let formatted = FormatterHelper.dateFormat(string: dateString)
        XCTAssertEqual(formatted, expected)
    }
}

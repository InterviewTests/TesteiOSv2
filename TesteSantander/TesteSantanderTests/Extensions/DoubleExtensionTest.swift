//
//  DoubleExtensionTest.swift
//  TesteSantanderTests
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class DoubleExtensionTest: XCTestCase {
    
    func testDoubleLocaleFormat() {
        let value = 20.0
        let stringValue = value.currencyFormatted()
        XCTAssertEqual(stringValue, "R$ 20,00")
    }
}

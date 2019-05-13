//
//  DoubleExtensionTest.swift
//  TesteiOSTests
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest

@testable import TesteiOS

class DoubleExtensionTest: XCTestCase {
    func testDoubleLocaleFormat() {
        let value = 100.0
        let stringValue = value.currencyFormatted()
        XCTAssertEqual(stringValue, "R$ 100,00")
    }
}

//
//  HexColorToUIColorTests.swift
//  Bank AppTests
//
//  Created by Chrystian on 17/01/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class HexColorToUIColorTests: XCTestCase {

    func testGeneretaUIColorFromHexWithPrefix() {
        let hexString = "#000000"
        let colorFromHex = hexString.hexColor()
        XCTAssertEqual(colorFromHex, UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1))
    }
    
    func testGeneretaUIColorFromHexWithoutPrefix() {
        let hexString = "000000"
        let colorFromHex = hexString.hexColor()
        XCTAssertEqual(colorFromHex, UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1))
    }
}

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
        let hexString = "#000"
        
        XCTAssertEqual(hexString.hexColor(), UIColor.black)
    }
}

//
//  DateExtensionTest.swift
//  TesteiOSTests
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest

@testable import TesteiOS

class DateExtensionTest: XCTestCase {
    
    func createDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: "1998-09-10") ?? Date()
    }
    
    func testToString() {
        guard let date = createDate() else { return }
        let stringDate = date.toString()
        
        XCTAssertEqual(stringDate, "10/09/1998")
    }
}

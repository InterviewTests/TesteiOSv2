//
//  DateExtension.swift
//  TesteSantanderTests
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class DateExtensionTest: XCTestCase {
    
    func createDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: "1987-11-12") ?? Date()
    }
    
    func testToString() {
        guard let date = createDate() else { return }
        let stringDate = date.toString()
        
        XCTAssertEqual(stringDate, "12/11/1987")
    }
}

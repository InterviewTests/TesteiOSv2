//
//  Date+extensiosnTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest

final class DateExtensionsTest: XCTestCase {

    // MARK: - Success date format

    func testSuccessDateFormat() {
        let formattedDate = Date(year: 1986, month: 12, day: 26).formatToString
        XCTAssertEqual("26/12/1986", formattedDate)
    }
}

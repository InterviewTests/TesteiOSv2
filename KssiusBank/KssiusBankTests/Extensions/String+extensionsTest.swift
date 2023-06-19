//
//  String+extensionTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

import XCTest

final class AccountNumberTest: XCTestCase {

    // MARK: - Success account format

    func testSuccessAccountFormat() {
        let accountNumberFormated = "12345678".toAccountFormat
        XCTAssertEqual("12.3456-78", accountNumberFormated)
    }

    func testSuccessAccountMoreNumbersFormat() {
        let accountNumberFormated = "123456789".toAccountFormat
        XCTAssertEqual("12.3456-78", accountNumberFormated)
    }

    // MARK: - Failure account format
    func testFailureStringAccountFormat() {
        let accountNumberFormated = "teste".toAccountFormat
        XCTAssertNil(accountNumberFormated)
    }

    // MARK: - Failure account format
    func testFailureAccountFormat() {
        let accountNumberFormated = "1234-5678".toAccountFormat
        XCTAssertEqual("12.3-4",accountNumberFormated)
    }
}

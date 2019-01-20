//
//  BankTests.swift
//  BankTests
//
//  Created by Thiago Lima on 19/01/19.
//  Copyright © 2019 SantanderTecnologia. All rights reserved.
//

import XCTest
@testable import Bank

class BankTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCPF() {
        XCTAssertTrue("35715925819".isValidCPF())
    }
    
    func testEmail() {
        XCTAssertTrue("presto.root@gmail.com".isValidEmail())
    }
    
    func testPassword() {
        XCTAssertTrue("Test@1".isValidPassword())
    }
    
    func testLogin() {
        let worker = LocationWorker()
        worker.login(user: "test_user", password: "Test@1", responseRequest: { response in
            XCTAssertNil(response.error)
        })
    }
    
    func testCurrency() {
        let worker = CurrencyWorker()
        worker.fetchStatements(userId: 1) { response in
            if response.statements != nil {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
        }
    }

}

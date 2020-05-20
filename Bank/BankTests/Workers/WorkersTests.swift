//
//  WorkersTests.swift
//  BankTests
//
//  Created by Luis Teodoro Junior on 20/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import XCTest
@testable import Bank

class WorkersTests: XCTestCase {
    
    var worker = Workers(withEnvironment: .production)
    
    func testLoginFetchSuccess() {
        let expectation = self.expectation(description: "Login")
        worker.loginFetch(request: User(user: "teste", password: "teste")) {  result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                expectation.fulfill()
            case .failure(_):
                XCTFail("⚠️ Error")
            }
        }
        waitForExpectations(timeout: 30.0, handler: nil)
    }
    
    func testLoginFetchError() {
        let expectation = self.expectation(description: "Login")
        worker.loginFetch(request: User()) {  result in
            switch result {
            case .success(_):
                XCTFail("⚠️ Error")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 30.0, handler: nil)
    }
    
    func testStatementsFetchSuccess() {
        let expectation = self.expectation(description: "Login")
        worker.statementsFetch(userId: 00) {  result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                expectation.fulfill()
            case .failure(_):
                XCTFail("⚠️ Error")
            }
        }
        waitForExpectations(timeout: 30.0, handler: nil)
    }
}

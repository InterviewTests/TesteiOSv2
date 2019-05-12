//
//  StatementsWorkerTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class StatementsWorkerTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: StatementsWorker!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        setupStatementsWorker()
    }
  
    // MARK: Test setup
  
    func setupStatementsWorker() {
        sut = StatementsWorker()
    }
  
    // MARK: Tests
    
    func testFetchStatement() {
        let expectation = XCTestExpectation(description: "fetch request")
    
        sut.fetchStatements(completionSuccess: { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, completionFailure: { (_) in })
        
        wait(for: [expectation], timeout: 30.0)
    }
}

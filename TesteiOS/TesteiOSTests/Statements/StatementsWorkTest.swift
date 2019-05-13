//
//  StatementsWorkTest.swift
//  TesteiOSTests
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest

@testable import TesteiOS

class StatementsWorkTest: XCTestCase {

    var sut: StatementsWorker!
    
    override func setUp() {
        super.setUp()
        setupStatementsWorker()
    }
    
    func setupStatementsWorker() {
        sut = StatementsWorker()
    }
    
    func testFetchStatement() {
        let expectation = XCTestExpectation(description: "get request")
        
        sut.getStatements(completionSuccess: { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, completionFailure: { (_) in })
        
        wait(for: [expectation], timeout: 30.0)
    }
}

//
//  StatementRetrieval.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class ExtratoWorkerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessfulStatementRetrieval(){
        let expectation = XCTestExpectation(description: "Get a statement from backend")
        let worker = ExtratoWorker()
        
        worker.retrieveStatement { (statement, result) in
            XCTAssert(result && (statement != nil))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20.0)
    }
    
}

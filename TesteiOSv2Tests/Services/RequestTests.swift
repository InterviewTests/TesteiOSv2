//
//  TesteiOSv2Tests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 26/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class RequestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessfullLoginRequest(){
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Get an user account from backend")
        
        let parameters = ["user": "x", "password": "y"]
        
        NetworkRequest.shared.send(endPoint: Constants.Request.login, httpMethod: .POST, additionalHeaders: nil, parameters: parameters, completionSuccess: { (data) in
                XCTAssertNotNil(UserAccountModel(data: data), "No user account was received.")
                expectation.fulfill()
        }, completionError: { (serverError) in
            XCTFail()
            expectation.fulfill()
        }) { (error) in
            XCTFail()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20.0)

    }

    func testUnsuccessfullLoginRequest(){
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Get an user account from backend")
        
        let parameters = ["user": "x", "password": "y"]
        
        NetworkRequest.shared.send(endPoint: "https://www.nowhere.tobefound", httpMethod: .POST, additionalHeaders: nil, parameters: parameters, completionSuccess: { (data) in
            XCTFail()
            expectation.fulfill()
        }, completionError: { (serverError) in
            XCTAssertTrue(true)
            expectation.fulfill()
        }) { (error) in
            XCTAssertTrue(true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20.0)

    }
    
    func testSuccessfullStatementRequest() {
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Get a statement from backend")
        
        NetworkRequest.shared.send(endPoint: Constants.Request.statements, httpMethod: .GET, additionalHeaders: nil, parameters: nil, completionSuccess: { (statement) in
            XCTAssertNotNil(statement, "No statement was received.")
            expectation.fulfill()
        }, completionError: { (error) in
            XCTFail()
            expectation.fulfill()
        }) { (error) in
            XCTFail()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20.0)
    }

    func testUnsuccessfullStatementRequest() {
        let expectation = XCTestExpectation(description: "Don't get a statement from backend")
        
        NetworkRequest.shared.send(endPoint: "https://www.nowhere.tobefound", httpMethod: .GET, additionalHeaders: nil, parameters: nil, completionSuccess: { (statement) in
            XCTFail()
            expectation.fulfill()
        }, completionError: { (error) in
            XCTAssert(true)
            expectation.fulfill()
        }) { (error) in
            XCTAssert(true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20.0)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

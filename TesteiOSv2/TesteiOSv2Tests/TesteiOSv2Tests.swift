//
//  TesteiOSv2Tests.swift
//  TesteiOSv2Tests
//
//  Created by Alexandre Gabassi on 04/11/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class TesteiOSv2Tests: XCTestCase {
    
    var navigationController: UINavigationController!
    var loginViewController: LoginViewController!

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmptyUserAndPassword() {
        
    }
    
}

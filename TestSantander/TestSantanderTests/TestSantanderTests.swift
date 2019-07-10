//
//  TestSantanderTests.swift
//  TestSantanderTests
//
//  Created by ely.assumpcao.ndiaye on 07/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import XCTest
@testable import TestSantander

class TestSantanderTests: XCTestCase {
    
    // MARK: - Subject under test
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        test_validatePassword()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    
    func test_validatePassword()
    {
        var status = false
        let validation = ValidationsFields()
        if validation.isValidPassword(passID: "!QAZ2wsx") == false {
            status = false
        }else {status = true}
        XCTAssert(status, "Verificar senha")
    }
    
    
    func test_username_placeholder() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! LoginViewController
        let _ = login.view
        XCTAssertEqual("Username", login.usernameTxt!.placeholder!)
    }
    
}

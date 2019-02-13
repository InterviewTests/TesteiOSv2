//
//  LoginWorkerTests.swift
//  TesteiOSv2Tests
//
//  Created by jeffersoncsilva on 13/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class LoginWorkerTests: XCTestCase {
    
    let loginWorker = LoginWorker()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginSuccessfully() {
        
        let expec = expectation(description: "Simple Request")
        let parameters: Dictionary<String, Any> = ["user":"test_user", "password": "fdf"]
        
        self.loginWorker.doLogin(parameters: parameters, success: { (response) in
            
            XCTAssertEqual(response.user?.name, "Jose da Silva Teste", "Login Successfully")

            expec.fulfill()

        }) { (error) in
            print(error)
        }

        waitForExpectations(timeout: 5.0)
        
    }
    
    func testLoginFailed() {
        
        let expec = expectation(description: "Simple Request")
        let parameters: Dictionary<String, Any> = ["user":"tes_user", "pssword": ""]
        
        self.loginWorker.doLogin(parameters: parameters, success: { (response) in
            
            XCTAssertNotNil(response.error, "Error is not nil")
            expec.fulfill()
            
        }) { (error) in
            
            XCTAssertNotNil(error, "Error is not nil")
            expec.fulfill()
        }
        
        waitForExpectations(timeout: 5.0)
        
    }

}

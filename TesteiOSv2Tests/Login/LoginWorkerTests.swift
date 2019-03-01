//
//  CredentialValidations.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class LoginWorkerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessfullUsernameValidation(){
        let worker = LoginWorker()
        let result = worker.isUsernameValid(username: "marcel.mendes@accenture.com")
        XCTAssertTrue(result)
    }

    func testUnsuccessfullUsernameValidation(){
        let worker = LoginWorker()
        let result = worker.isUsernameValid(username: "marcel.mendes#accenture.com")
        XCTAssertTrue(!result)
    }
    
    func testSuccessfullPasswordValidation(){
        let worker = LoginWorker()
        let result = worker.isPasswordValid(password: "A1$")
        XCTAssertTrue(result)
    }

    // regras: 1 maiúscula, 1 número, 1 caracter especial
    func testUnsuccessfullPasswordValidationRule1(){
        let worker = LoginWorker()
        let result = worker.isPasswordValid(password: "a1$")
        XCTAssertTrue(!result)
    }

    // regras: 1 maiúscula, 1 número, 1 caracter especial
    func testUnsuccessfullPasswordValidationRule2(){
        let worker = LoginWorker()
        let result = worker.isPasswordValid(password: "A$")
        XCTAssertTrue(!result)
    }

    // regras: 1 maiúscula, 1 número, 1 caracter especial
    func testUnsuccessfullPasswordValidationRule3(){
        let worker = LoginWorker()
        let result = worker.isPasswordValid(password: "A1")
        XCTAssertTrue(!result)
    }

    func testSuccessfulCredentialsValidationRequest(){
        let expectation = XCTestExpectation(description: "Get a user account from backend")
        let worker = LoginWorker()
        
        worker.validateCredentials(username: "x", password: "y") { (userAccount, result) in
            XCTAssert(result && (userAccount != nil))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
    

}

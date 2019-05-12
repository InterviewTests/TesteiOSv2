//
//  LoginWorkerTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class LoginWorkerTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: LoginWorker!
  
  // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        setupWorker()
    }
    
    func setupWorker() {
        sut = LoginWorker()
    }
  
    func testCreateRequest() {
        guard let url = URL(string: Constants.Url.login) else { return }
        let requestData = LoginModel.Login.Request(user: "teste@teste.com", password: "Teste@1")
        let request = sut.createRequest(requestData: requestData, urlRequest: url)
        XCTAssertNotNil(request)
        XCTAssertEqual(request.httpMethod, "POST")
    }
    
    func testValidUsername() {
        let isValid = sut.validateUserName(username: "teste@teste.com")
        XCTAssertTrue(isValid)
    }
    
    func testValidUsernameFail() {
        let isInvalid = sut.validateUserName(username: "teste.teste@")
        XCTAssertFalse(isInvalid)
    }
    
    func testValidPassword() {
        let isValid = sut.validatePassword(password: "Teste@1")
        XCTAssertTrue(isValid)
    }
    
    func testValidPasswordFail() {
        let isInvalid = sut.validatePassword(password: "teste@1")
        XCTAssertFalse(isInvalid)
    }
    
    func testLoginRequest() {
        let expectation = XCTestExpectation(description: "validate login request")
        
        sut.login(requestData: LoginModel.Login.Request(user: "teste@teste.com", password: "Teste@1"), completionSuccess: { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, completionFailure: { (failure) in })
        
        wait(for: [expectation], timeout: 30.0)
    }
}

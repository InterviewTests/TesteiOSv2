//
//  LoginInteractorTests.swift
//  BankTests
//
//  Created by Luis Teodoro Junior on 20/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import XCTest
@testable import Bank

class LoginInteractorTests: XCTestCase {
    
    var interactor: LoginInteractor!
    
    override func setUp() {
        interactor = LoginInteractor()
    }
    
    override func tearDown() {
        interactor = nil
    }
    
    class LoginPresentationLogicSpy: LoginPresentationLogic {
        
        var presentTellStatementsCalled = false
        var presentTellStatementsErrorCalled = false
        
        var fetchIStatements: XCTestExpectation?
        var fetchIStatementsError: XCTestExpectation?
        
        func presentTellStatements(response: Login.Response) {
            presentTellStatementsCalled = true
            
            guard let expected = fetchIStatements else {
                return
            }
            XCTAssertNotNil(response)
            XCTAssertEqual(presentTellStatementsErrorCalled, false)
            expected.fulfill()
        }
        
        func presentTellStatementsError(response: Login.Response) {
            presentTellStatementsErrorCalled = true
            
            guard let expected = fetchIStatementsError else {
                return
            }
            XCTAssertNotNil(response)
            expected.fulfill()
        }
        
        func presentGetUserData(request: Login.Response) { }
    }
    
    
    func testLoginFetchPasswordError() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        interactor.tellStatements(request: Login.Request(user: User(user: "teste@teste.com", password: "")))
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsErrorCalled, true)
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsCalled, false)
    }
    
    func testLoginFetchPasswordInvalidError() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        interactor.tellStatements(request: Login.Request(user: User(user: "teste@teste.com", password: "test@123")))
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsErrorCalled, true)
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsCalled, false)
    }
    
    func testLoginFetchCPFInvalidError() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        interactor.tellStatements(request: Login.Request(user: User(user: "01031937070", password: "Test@123")))
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsErrorCalled, true)
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsCalled, false)
    }
    
    func testLoginFetchEmailInvalidError() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        interactor.tellStatements(request: Login.Request(user: User(user: "teste@teste", password: "Test@123")))
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsErrorCalled, true)
        XCTAssertEqual(loginPresentationLogicSpy.presentTellStatementsCalled, false)
    }
    
    func testLoginFetchEmailSuccess() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        loginPresentationLogicSpy.fetchIStatements = self.expectation(description: "Success Email")
        interactor.tellStatements(request: Login.Request(user: User(user: "teste@teste.com", password: "tesr@T1")))
        wait(for: [loginPresentationLogicSpy.fetchIStatements!], timeout: 30.0)
    }
    
    func testLoginFetchCpfSuccess() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        loginPresentationLogicSpy.fetchIStatements = self.expectation(description: "Success CPF")
        interactor.tellStatements(request: Login.Request(user: User(user: "01031937072", password: "tesr@T1")))
        wait(for: [loginPresentationLogicSpy.fetchIStatements!], timeout: 30.0)
    }
    
    func testLoginFetchError() {
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        interactor.presenter = loginPresentationLogicSpy
        loginPresentationLogicSpy.fetchIStatementsError = self.expectation(description: "Error ")
        interactor.loginFetch(request: Login.Request(user: User()))
        wait(for: [loginPresentationLogicSpy.fetchIStatementsError!], timeout: 30.0)
    }
}

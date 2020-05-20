//
//  LoginPresenterTests.swift
//  BankTests
//
//  Created by Luis Teodoro Junior on 20/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import XCTest
@testable import Bank

class LoginPresenterTests: XCTestCase {
    
    var presenter: LoginPresenter!
    
    override func setUp() {
        presenter = LoginPresenter()
    }
    
    override func tearDown() {
        presenter = nil
    }
    
    class LoginDisplayLogicSpy: LoginDisplayLogic {
        
        var displayStatementsSuccessCalled = false
        var displayStatementsErrorCalled = false
        var displayUserDataCalled = false
        
        func displayStatementsSuccess(viewModel: Login.ViewModel) {
            displayStatementsSuccessCalled = true
        }
        
        func displayStatementsError(viewModel: Login.ViewModel) {
            displayStatementsErrorCalled = true
        }
        
        func displayUserData(viewModel: Login.ViewModel) {
            displayUserDataCalled = true
        }
    }
    
    func testPresentTellStatementsError() {
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        presenter.viewController = loginDisplayLogicSpy
        presenter.presentTellStatementsError(response: Login.Response())
        XCTAssertEqual(loginDisplayLogicSpy.displayStatementsSuccessCalled, false)
        XCTAssertEqual(loginDisplayLogicSpy.displayStatementsErrorCalled, true)
        XCTAssertEqual(loginDisplayLogicSpy.displayUserDataCalled, false)
    }
    
    func testPresentTellStatements() {
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        presenter.viewController = loginDisplayLogicSpy
        presenter.presentTellStatements(response: Login.Response())
        XCTAssertEqual(loginDisplayLogicSpy.displayStatementsSuccessCalled, true)
        XCTAssertEqual(loginDisplayLogicSpy.displayStatementsErrorCalled, false)
        XCTAssertEqual(loginDisplayLogicSpy.displayUserDataCalled, false)
    }
    
    func testPresentGetUserData() {
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        presenter.viewController = loginDisplayLogicSpy
        presenter.presentGetUserData(request: Login.Response())
        XCTAssertEqual(loginDisplayLogicSpy.displayStatementsSuccessCalled, false)
        XCTAssertEqual(loginDisplayLogicSpy.displayStatementsErrorCalled, false)
        XCTAssertEqual(loginDisplayLogicSpy.displayUserDataCalled, true)
    }
}

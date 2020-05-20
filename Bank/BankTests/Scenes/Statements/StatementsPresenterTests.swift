//
//  StatementsPresenterTests.swift
//  BankTests
//
//  Created by Luis Teodoro Junior on 20/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import XCTest
@testable import Bank

class StatementsPresenterTests: XCTestCase {
    
    var presenter: StatementsPresenter!
    
    override func setUp() {
        presenter = StatementsPresenter()
    }
    
    override func tearDown() {
        presenter = nil
    }
    
    class StatementsDisplayLogicSpy: StatementsDisplayLogic {
        
        var displayUserCalled = false
        var displayStatementsCalled = false
        var displayStatementsErrorCalled = false
        var displayGetOutCalled = false
        
        func displayUser(viewModel: Statements.ViewModel) {
            displayUserCalled = true
        }
        
        func displayStatements(viewModel: Statements.ViewModel) {
            displayStatementsCalled = true
        }
        
        func displayStatementsError(viewModel: Statements.ViewModel) {
            displayStatementsErrorCalled = true
        }
        
        func displayGetOut(viewModel: Statements.ViewModel) {
            displayGetOutCalled = true
        }
    }
    
    func testPresentGetStatements() {
        let statementsDisplayLogicSpy = StatementsDisplayLogicSpy()
        presenter.viewController = statementsDisplayLogicSpy
        presenter.presentGetStatements(response: Statements.Response())
        XCTAssertEqual(statementsDisplayLogicSpy.displayUserCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsCalled, true)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsErrorCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayGetOutCalled, false)
    }
    
    func testPresentGetOut() {
        let statementsDisplayLogicSpy = StatementsDisplayLogicSpy()
        presenter.viewController = statementsDisplayLogicSpy
        presenter.presentGetOut(response: Statements.Response())
        XCTAssertEqual(statementsDisplayLogicSpy.displayUserCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsErrorCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayGetOutCalled, true)
    }
    
    func testPresentGetUserLogin() {
        let statementsDisplayLogicSpy = StatementsDisplayLogicSpy()
        presenter.viewController = statementsDisplayLogicSpy
        presenter.presentGetUserLogin(response: Statements.Response())
        XCTAssertEqual(statementsDisplayLogicSpy.displayUserCalled, true)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsErrorCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayGetOutCalled, false)
    }
    
    func testPresentGetStatementsError() {
        let statementsDisplayLogicSpy = StatementsDisplayLogicSpy()
        presenter.viewController = statementsDisplayLogicSpy
        presenter.presentGetStatementsError(response: Statements.Response())
        XCTAssertEqual(statementsDisplayLogicSpy.displayUserCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsCalled, false)
        XCTAssertEqual(statementsDisplayLogicSpy.displayStatementsErrorCalled, true)
        XCTAssertEqual(statementsDisplayLogicSpy.displayGetOutCalled, false)
    }
}

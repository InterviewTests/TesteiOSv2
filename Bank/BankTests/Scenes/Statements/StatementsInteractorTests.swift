//
//  StatementsInteractorTests.swift
//  BankTests
//
//  Created by Luis Teodoro Junior on 20/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import XCTest
@testable import Bank

class StatementsInteractorTests: XCTestCase {
    
    var interactor: StatementsInteractor!
    var userAccount: UserAccount!
    
    override func setUp() {
        interactor = StatementsInteractor()
        userAccount = UserAccount(userId: 0, name: "", bankAccount: "", agency: "", balance: 0.0)
    }
    
    override func tearDown() {
        interactor = nil
    }
    
    class StatementsPresentationLogicSpy: StatementsPresentationLogic {
        
        var presentGetUserLoginCalled = false
        var presentGetStatementsCalled = false
        var presentGetStatementsErrorCalled = false
        var presentGetOutCalled = false
        
        var fetchIStatements: XCTestExpectation?
        var fetchIStatementsError: XCTestExpectation?
        
        func presentGetUserLogin(response: Statements.Response) {
            presentGetUserLoginCalled = true
        }
        
        func presentGetStatements(response: Statements.Response) {
            presentGetStatementsCalled = true
            guard let expected = fetchIStatements else {
                return
            }
            XCTAssertNotNil(response)
            expected.fulfill()
        }
        
        func presentGetStatementsError(response: Statements.Response) {
            presentGetStatementsErrorCalled = true
        }
        
        func presentGetOut(response: Statements.Response) {
            presentGetOutCalled = true
        }
    }
    
    func testGetStatementListSuccess() {
        let statementsPresentationLogicSpy = StatementsPresentationLogicSpy()
        interactor.presenter = statementsPresentationLogicSpy
        statementsPresentationLogicSpy.fetchIStatements = self.expectation(description: "Success")
        interactor.getStatementList(request: Statements.Request(userAccount: userAccount))
        wait(for: [statementsPresentationLogicSpy.fetchIStatements!], timeout: 30.0)
    }
    
    func testGetOut() {
        let statementsPresentationLogicSpy = StatementsPresentationLogicSpy()
        interactor.presenter = statementsPresentationLogicSpy
        interactor.getOut(request: Statements.Request())
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetUserLoginCalled, false)
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetStatementsCalled, false)
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetStatementsErrorCalled, false)
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetOutCalled, true)
    }
    
    func testGetUserLogin() {
        let statementsPresentationLogicSpy = StatementsPresentationLogicSpy()
        interactor.presenter = statementsPresentationLogicSpy
        interactor.getUserLogin(request: Statements.Request())
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetUserLoginCalled, true)
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetStatementsCalled, false)
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetStatementsErrorCalled, false)
        XCTAssertEqual(statementsPresentationLogicSpy.presentGetOutCalled, false)
    }
}

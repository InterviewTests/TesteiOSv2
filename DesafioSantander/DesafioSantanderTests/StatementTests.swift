//
//  StatementTests.swift
//  DesafioSantanderTests
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import XCTest
@testable import DesafioSantander

class StatementTests: XCTestCase {

    var interactor: AccountInteractor!
    var promise: XCTestExpectation!
    var statements: [Statement]?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = AccountInteractor()
        promise = expectation(description: "Request")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    class AccountPresenterSpy: AccountPresentationLogic {
        var objectTest: StatementTests?
        var presentFetchedCalled = false
        
        // MARK: Spied methods
        func presentStatementsFetched(_ statements: [Statement], _ error: Error?) {
            objectTest?.statements = statements
            presentFetchedCalled = true
            objectTest?.promise.fulfill()
        }
    }

    func testWhenUserGetStatementsReturnsListOfStatements() {
        let userId = 1
        
        let presenterSpy = AccountPresenterSpy()
        presenterSpy.objectTest = self
        interactor.presenter = presenterSpy
        
        interactor.fetchStatements(userId: userId)
        waitForExpectations(timeout: 5, handler: nil)
  
        XCTAssertTrue(self.statements?.count ?? 0 > 0)
        XCTAssert(presenterSpy.presentFetchedCalled)
    }
}

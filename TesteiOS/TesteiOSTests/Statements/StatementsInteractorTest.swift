//
//  StatementsInteractorTest.swift
//  TesteiOSTests
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest

@testable import TesteiOS

class StatementsInteractorTest: XCTestCase {

    var sut: StatementsInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupStatementsInteractor()
    }
    
    // MARK: Test setup
    
    func setupStatementsInteractor() {
        sut = StatementsInteractor()
    }
    
    // MARK: Test spies
    
    class StatementsPresentationLogicSpy: StatementsPresentationLogic {
        var getStatementIsCalled = false
        var getErrorIsCalled = false
        var setupHeaderIsCalled = false
        
        func presentGetStatements(response: StatementsModel.Fetch.Response) {
            getStatementIsCalled = true
        }
        
        func presenGetStatementsError(error: String) {
            getErrorIsCalled = true
        }
        
        func setupHeader(data: StatementsModel.Header.Response) {
            setupHeaderIsCalled = true
        }
    }
    
    class StatementWorkerSpy: StatementsWorker {
        let presentationLogic = StatementsPresentationLogicSpy()
        
        override func getStatements(completionSuccess: @escaping GetStatementResponseSuccess, completionFailure: @escaping GetStatementResponseFailure) {
            let response = StatementsModel.Fetch.Response(statements: nil)
            presentationLogic.presentGetStatements(response: response)
        }
    }
    
    // MARK: Tests
    
    func testFetchStatements() {
        let worker = StatementWorkerSpy()
        sut.worker = worker
        
        sut.getStatements()
        XCTAssertTrue(worker.presentationLogic.getStatementIsCalled)
    }
    
    func testeSetupHeader() {
        let statementPresentationSpy = StatementsPresentationLogicSpy()
        sut.presenter = statementPresentationSpy
        let request = StatementsModel.Header.Request(headerDataResponse: nil)
        
        sut.getHeader(data: request)
        XCTAssertTrue(statementPresentationSpy.setupHeaderIsCalled)
    }
}

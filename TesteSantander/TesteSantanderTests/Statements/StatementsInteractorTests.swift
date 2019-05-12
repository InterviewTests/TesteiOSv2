//
//  StatementsInteractorTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class StatementsInteractorTests: XCTestCase {
    // MARK: Subject under test
  
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
        var fetchStatementIsCalled = false
        var fetchErrorIsCalled = false
        var setupHeaderIsCalled = false
        
        func presentFetchStatements(response: StatementsModel.Fetch.Response) {
            fetchStatementIsCalled = true
        }
        
        func presentFetchError(error: String) {
            fetchErrorIsCalled = true
        }
        
        func setupHeader(data: StatementsModel.Header.Response) {
            setupHeaderIsCalled = true
        }
    }
    
    class StatementWorkerSpy: StatementsWorker {
        let presentationLogic = StatementsPresentationLogicSpy()
        
        override func fetchStatements(completionSuccess: @escaping FetchStatementResponseSuccess, completionFailure: @escaping FetchStatementResponseFailure) {
            let response = StatementsModel.Fetch.Response(statements: nil)
            presentationLogic.presentFetchStatements(response: response)
        }
    }
  
    // MARK: Tests
    
    func testFetchStatements() {
        let worker = StatementWorkerSpy()
        sut.worker = worker
        
        sut.fetchStatements()
        XCTAssertTrue(worker.presentationLogic.fetchStatementIsCalled)
    }
    
    func testeSetupHeader() {
        let statementPresentationSpy = StatementsPresentationLogicSpy()
        sut.presenter = statementPresentationSpy
        let request = StatementsModel.Header.Request(headerData: nil)
        
        sut.fetchHeader(data: request)
        XCTAssertTrue(statementPresentationSpy.setupHeaderIsCalled)
    }
}

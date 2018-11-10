//
//  StatementListInteractorTests.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright (c) 2018 Bruno Scheltzke. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TesteiOSv2
import XCTest

class StatementListInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: StatementListInteractor!

    // MARK: Test lifecycle

    override func setUp() {
    super.setUp()
        setupStatementListInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupStatementListInteractor() {
        sut = StatementListInteractor()
        let user = User(userId: 1, name: "", bankAccount: "", agency: "", balance: 2)
        sut.user = user
    }

    // MARK: Test doubles
    
    class StatementListWorkerSpy: StatementListWorker {
        var fetchStatementsCalled = false
        var shouldFailRequet = false
        
        override func fetchStatements(of user: User, completion: @escaping(Result<[Statement]>) -> Void) {
            fetchStatementsCalled = true
            if shouldFailRequet {
                completion(.failure(CustomError.internetConnection))
            } else {
                let statement = Statement(title: "test", desc: "description", date: "12/12/12", value: 20)
                completion(.success([statement]))
            }
        }
    }
    
    class StatementListPresentationLogicSpy: StatementListPresentationLogic {
        var presentUserInfoCalled = false
        var presentStatementsCalled = false
        var presentErrorCalled = false
        
        func presentUserInfo(response: StatementList.UserDetail.Response) {
            presentUserInfoCalled = true
        }
        
        func presentStatements(response: StatementList.Fetch.Response) {
            presentStatementsCalled = true
        }
        
        func presentError(response: StatementList.Fetch.Response) {
            presentErrorCalled = true
        }
    }

    // MARK: Tests
    func testFetchUserInfo() {
        // Given
        let presenterSpy = StatementListPresentationLogicSpy()
        sut.presenter = presenterSpy
        
        // When
        sut.fetchUserInfo(request: StatementList.UserDetail.Request())
        
        // Then
        XCTAssertTrue(presenterSpy.presentUserInfoCalled, "fetchUserInfo(request: ) should call the presenter with the given info")
    }
    
    func testFetchStatements() {
        // Given
        let presenterSpy = StatementListPresentationLogicSpy()
        sut.presenter = presenterSpy
        let workerSpy = StatementListWorkerSpy()
        sut.worker = workerSpy
        
        // When
        sut.fetchUserStatements(request: StatementList.Fetch.Request())
        
        // Then
        XCTAssertTrue(workerSpy.fetchStatementsCalled, "fetchUserStatements(request: ) should call the worker to perform the request")
        XCTAssertTrue(presenterSpy.presentStatementsCalled, "fetchUserStatements(request: ) should call the presenter to display the received info from the worker")
    }
    
    func testFailFetchStatements() {
        // Given
        let presenterSpy = StatementListPresentationLogicSpy()
        sut.presenter = presenterSpy
        let workerSpy = StatementListWorkerSpy()
        workerSpy.shouldFailRequet = true
        sut.worker = workerSpy
        
        // When
        sut.fetchUserStatements(request: StatementList.Fetch.Request())
        
        // Then
        XCTAssertTrue(workerSpy.fetchStatementsCalled, "fetchUserStatements(request: ) should call the worker to perform the request")
        XCTAssertTrue(presenterSpy.presentErrorCalled, "fetchUserStatements(request: ) should call the presenter to display an error message when the worker fail to retrieve the requested information")
    }
}

//
//  HomeWorkerTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest
@testable import KssiusBank

final class HomeWorkTest: XCTestCase {

    var sut: HomeWorkerLogic?

    override func setUp() {
        super.setUp()
        let statementsRepository = MockSuccessStatementsRepository()
        sut = HomeWorker(statementsRepository:  statementsRepository)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success fetch statements

    func testSuccessLogin() {

        let statementsRepository = MockSuccessStatementsRepository()

        let expectation = self.expectation(description: "Wait for execute fetch statements")

        sut = HomeWorker(statementsRepository: statementsRepository)

        sut?.fetchStatements { result in
            XCTAssertEqual(result, .success(Seeds.Statements.statements))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(statementsRepository.performLoginCalled)

    }

    // MARK: - Failure statements fetch network

    func testFailureNetwork() {

        let statementsRepository = MockFailureStatementsRepository(statementsFailure: .network(.init()))
        let expectation = self.expectation(description: "Wait for execute fetch statements")

        sut = HomeWorker(statementsRepository: statementsRepository)

        sut?.fetchStatements { result in
            XCTAssertEqual(result, .failure(.network(.init())))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(statementsRepository.fetchStatementsCalled)

    }
}

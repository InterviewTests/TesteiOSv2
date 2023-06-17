//
//  StatementsRepositoryTest.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//

import XCTest
@testable import KssiusBank

final class StatementsRepositoryTest: XCTestCase {
    var sut: StatementsRepositoryProtocol?

    override func setUp() {
        sut = StatementsRepository(authenticationService: MockSuccessStatementsServiceDatasource())
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Success Authentication Response

    func testSuccessResponse() {
        let expectation = expectation(description: "Waiting for execute fetch statements to complete.")
        sut?.fetch(statements: .statementsRequest ){ result in
            switch(result){
            case .success(let userModel):
                XCTAssertEqual(userModel, Seeds.Statements.statements)
            case .failure( _):
                XCTFail("Should not return a failure")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Server Error Response

    func testErrorResponse() {

        let failureNetwork = MockFailureNetworkStatementsServiceDatasource()
        sut = StatementsRepository(authenticationService: failureNetwork)

        let expectation = expectation(description: "Waiting for fetch statements to complete.")

        sut?.fetch(statements: .statementsRequest){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .network(.init()))
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}


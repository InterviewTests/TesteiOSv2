//
//  AutenticationRepositoryTest.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation


import XCTest
@testable import KssiusBank

final class AutenticationRepositoryTest: XCTestCase {
    var sut: AuthenticationRepositoryProtocol?
    var expectation: XCTestExpectation!

    override func setUp() {
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource(networkService: .init()))
        expectation = expectation(description: "AuthenticationServiceDatasource Expectation")
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Success Authentication Response

    func testSuccessResponse() {
        let modelRequest = LoginRequestModel(username: "user", password: "pass")

        sut?.perform(login: .loginRequest, with: modelRequest ){ [weak self] result in
            switch(result){
            case .success(let userModel):
                XCTAssertEqual(userModel.email, "Marquis_Gibson@hotmail.com")
            case .failure( _):
                XCTFail("Should not return a failure")
            }
            self?.expectation.fulfill()
        }
        wait(for: [self.expectation], timeout: 1.0)
    }

    // MARK: - Server Error Response

    func testErrorResponse() {

        let failureNetwork = MockFailureNetworkAutenticationServiceDatasource(networkService: .init())
        sut = AuthenticationRepository(authenticationService: failureNetwork)

        let modelRequest = LoginRequestModel(username: "error", password: "errorpass")

        sut?.perform(login: .loginRequest, with: modelRequest){ [weak self] result in

            //THEN
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                switch( error ){
                case .network( _):
                    XCTAssertEqual(error, BankFailure.network(.init()))
                default:
                    XCTFail("Should not return a failure")
                }
            }
            self?.expectation.fulfill()
        }
        wait(for: [self.expectation], timeout: 1.0)
    }
}

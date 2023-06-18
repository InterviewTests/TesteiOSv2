//
//  LoginWorkerTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest
@testable import KssiusBank

final class LoginWorkTest: XCTestCase {

    var sut: LoginWorkerLogic?

    override func setUp() {
        super.setUp()
        // remove datasource
        let authenticationRepository = MockSuccessAuthenticationRepository()

        sut = LoginWorker(authenticaionRepository: authenticationRepository)

    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success login

    func testSuccessLogin() {
        // remove datasource
        let authenticationRepository = MockSuccessAuthenticationRepository()

        let expectation = self.expectation(description: "testSuccessSaveUser")

        sut = LoginWorker(authenticaionRepository: authenticationRepository)

        sut?.login(username: Seeds.email, password: Seeds.password) { result in
            XCTAssertEqual(result, .success(Seeds.user))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(authenticationRepository.performLoginCalled)

    }

    // MARK: - Failure login password

    func testFailurePasswordLogin() {

        let authenticationRepository = MockFailureAuthenticationRepository(userFailure: .password)
        let expectation = self.expectation(description: "testFailureLogin")

        sut = LoginWorker(authenticaionRepository: authenticationRepository)

        sut?.login(username: Seeds.email, password: Seeds.password) { result in
            XCTAssertEqual(result, .failure(.password))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(authenticationRepository.performLoginCalled)

    }

    // MARK: - Failure login user

    func testFailureUserLogin() {

        let authenticationRepository = MockFailureAuthenticationRepository(userFailure: .user)
        let expectation = self.expectation(description: "testFailureLogin")

        sut = LoginWorker(authenticaionRepository: authenticationRepository)

        sut?.login(username: Seeds.email, password: Seeds.password) { result in
            XCTAssertEqual(result, .failure(.user))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(authenticationRepository.performLoginCalled)

    }

}

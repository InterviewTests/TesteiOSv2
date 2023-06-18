//
//  UserWorkersTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

import XCTest
@testable import KssiusBank

final class UserWorkersTest: XCTestCase {

    var sut: UserWorkerLogic?

    override func setUp() {
        sut = UserWorker(authenticationLocalRepository: MockSuccessAuthenticationLocalRepository() )
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Success save user

    func testSuccessSaveUser() {
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        guard let data = data,
              let user = try? JSONDecoder().decode(UserAccountModel.self, from: data) else {
                XCTFail("Should not return a failure")
            return
        }
        let result = sut?.save(user: user)
        validate(userAccount: result)
    }

    // MARK: - Failure save user

    func testSuccessGetUser() {
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        guard let data = data,
              let user = try? JSONDecoder().decode(UserAccountModel.self, from: data) else {
                XCTFail("Should not return a failure")
            return
        }
        sut?.save(user: user)
        let result = sut?.retrieveUser()
        validate(userAccount: result)
    }

    // MARK: - Failure save user

    func testFailureSaveUser() {
        sut = UserWorker(authenticationLocalRepository: MockEmptyAuthenticationLocalRepository())
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        guard let data = data,
              let user = try? JSONDecoder().decode(UserAccountModel.self, from: data) else {
                XCTFail("Should not return a failure")
            return
        }
        let result = sut?.save(user: user)
        XCTAssertNil(result)
    }

    // MARK: - Failure save user

    func testEmptyGetUser() {
        sut = UserWorker(authenticationLocalRepository: MockEmptyAuthenticationLocalRepository())
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        guard let data = data,
              let user = try? JSONDecoder().decode(UserAccountModel.self, from: data) else {
                XCTFail("Should not return a failure")
            return
        }
        sut?.save(user: user)
        let result = sut?.retrieveUser()
        XCTAssertNil(result)
    }

    private func validate(userAccount result: UserAccountModel?) {
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.userId, "3")
        XCTAssertEqual(result?.cpf, "468.655.400-42")
        XCTAssertEqual(result?.name, "Diana Leuschke")
        XCTAssertEqual(result?.email, "Marquis_Gibson@hotmail.com")
        XCTAssertEqual(result?.accountNumber, "74393734")
        XCTAssertEqual(result?.agency, "827810101")
        XCTAssertEqual(result?.balance, 472.29)
    }
    
}

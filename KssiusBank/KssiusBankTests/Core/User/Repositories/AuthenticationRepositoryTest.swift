//
//  AutenticationRepositoryTest.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import XCTest
@testable import KssiusBank

final class AuthenticationRepositoryTest: XCTestCase {
    var sut: AuthenticationRepositoryProtocol?
    let successCpfModelRequest = LoginRequestModel(username: "468.655.400-42", password: "T@to123")
    let successEmailModelRequest = LoginRequestModel(username: "Marquis_Gibson@hotmail.com", password: "T@to123")

    override func setUp() {
        super.setUp()
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success Authentication Response

    func testSuccessResponse() {
        let expectation = expectation(description: "Waiting for execute login to complete.")
        sut?.perform(login: .loginRequest, with: successCpfModelRequest ){ result in
            switch(result){
            case .success(let userModel):
                XCTAssertEqual(userModel.email, "Marquis_Gibson@hotmail.com")
            case .failure( _):
                XCTFail("Should not return a failure")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Server Error Response

    func testErrorResponse() {

        let failureNetwork = MockFailureNetworkAutenticationServiceDatasource()
        sut = AuthenticationRepository(authenticationService: failureNetwork)

        let modelRequest = LoginRequestModel(username: "468.655.400-42", password: "T@to123")
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest){ result in
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


// MARK: - CPF Tests
extension AuthenticationRepositoryTest {

    // MARK: - Success CPF Authentication Response

    func testSuccessCpfResponse() {
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: successCpfModelRequest ){ result in
            switch(result){
            case .success( let userModel):
                XCTAssertEqual(userModel.email, "Marquis_Gibson@hotmail.com")
            case .failure( _):
                XCTFail("Should not return a failure")

            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }


    // MARK: - Failure CPF Authentication Response

    func testFailureCpfResponse() {
        let modelRequest = LoginRequestModel(username: "331.876.789.90", password: "pass")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .user)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}


// MARK: - Email Tests
extension AuthenticationRepositoryTest {

    // MARK: - Success Email Authentication

    func testSuccessEmailResponse() {
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: successEmailModelRequest ){ result in
            switch(result){
            case .success( let userModel):
                XCTAssertEqual(userModel.email, "Marquis_Gibson@hotmail.com")
            case .failure( _):
                XCTFail("Should not return a failure")

            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Success Email Authentication With Dot

    func testSuccessEmailWithDotResponse() {
        let successEmailModelRequest = LoginRequestModel(username: "Marquis.Gibson@hotmail.com", password: "T@to123")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: successEmailModelRequest ){ result in
            switch(result){
            case .success( let userModel):
                XCTAssertEqual(userModel.email, "Marquis_Gibson@hotmail.com")
            case .failure( _):
                XCTFail("Should not return a failure")

            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }


    // MARK: - Failure Email domain

    func testFailureEmailDomainResponse() {
        let modelRequest = LoginRequestModel(username: "test@teste", password: "pass")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .user)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Failure Email Authentication Response

    func testFailureEmailTextResponse() {
        let modelRequest = LoginRequestModel(username: "test tt@teste", password: "pass")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .user)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}



// MARK: - Password Tests
extension AuthenticationRepositoryTest {

    // MARK: - Failure Password Special char Authentication

    func testFailurePasswordSpecialCharResponse() {
        let modelRequest = LoginRequestModel(username: "test@test.com", password: "Tato123")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .password)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Failure Password Upper char Authentication

    func testFailurePasswordUpperCharResponse() {
        let modelRequest = LoginRequestModel(username: "test@test.com", password: "t@to123")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .password)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Failure Password Number Authentication

    func testFailurePasswordNumberResponse() {
        let modelRequest = LoginRequestModel(username: "test@test.com", password: "T@toBAC")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .password)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Failure Password Alpha char Authentication

    func testFailurePasswordAlphaResponse() {
        let modelRequest = LoginRequestModel(username: "test@test.com", password: "%@45123")
        sut = AuthenticationRepository(authenticationService: MockSuccessAutenticationServiceDatasource())
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                XCTAssertEqual(error , .password)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

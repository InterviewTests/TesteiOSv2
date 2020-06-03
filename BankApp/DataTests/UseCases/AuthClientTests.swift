//
//  APIAuthClientTests.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Domain
@testable import Data

class AuthClientTests: XCTestCase {
    
    func testLoginShouldCallHttpClientWithUrlCorrect() {
        let (sut, httpClientSpy) = makeSut(with: url)
        sut.login(authenticationModel: authClientModel) { _ in }
        XCTAssertEqual(httpClientSpy.url, [url])
    }
    
    func testLoginShouldCallHttpClientWithDataCorrect() {
        let (sut, httpClientSpy) = makeSut()
        sut.login(authenticationModel: authClientModel) { _ in }
        XCTAssertEqual(httpClientSpy.data, authClientModel.data)
    }
    
    func testLoginShouldCompleteWithErrorWhenUserFails() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unknown), whem: {
            httpClientSpy.completeWith(error: .noConnectivity)
        })
    }
    
    func testLoginShouldCompleteWithAcountWhenUserGiveSuccesWithValidData() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .success(userAccount), whem: {
            httpClientSpy.completeWith(data: userAccount.data!)
        })
    }
    
    func testLoginShouldCompleteWithAcountWhenUserGiveSuccesWithInvalidData() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.convert), whem: {
            httpClientSpy.completeWith(data: dataInvalid)
        })
    }
    
    func test_login_should_not_complete_if_sut_has_deinit() {
        let httpClientSpy = HTTPPostClientSpy()
        var sut: AuthClientUseCase? = .init(url: url, httpClient: httpClientSpy)
        var result: Result<UserAccount, DomainError>?
        sut?.login(authenticationModel: authClientModel, completion: { result = $0 })
        sut = nil
        httpClientSpy.completeWith(data: dataInvalid)
        XCTAssertNil(result)
    }
}

extension AuthClientTests {
    
    var authClientModel: AuthClientModel {
        return .init(email: "email_any", password: "email_password")
    }
    
    func makeSut(with url: URL = URL(string: "http://url-mock.com")!, file: StaticString = #file, line: UInt = #line) -> (sut: AuthClientUseCase, httpClientSpy: HTTPPostClientSpy) {
        let httpClientSpy = HTTPPostClientSpy()
        let sut = AuthClientUseCase(url: url, httpClient: httpClientSpy)
        memoryLeakCheckWith(instance: sut, file: file, line: line)
        memoryLeakCheckWith(instance: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
    
    func expect(_ sut: AuthClientUseCase, completeWith expectedResult: Result<UserAccount, DomainError>, whem action: () -> Void, file: StaticString = #file, line: UInt = #line) {
        let expectetion = expectation(description: "waiting")
        sut.login(authenticationModel: authClientModel) { receivedResult in
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)): XCTAssertEqual(expectedError, receivedError, file: file, line: line)
            case (.success(let expectedModel), .success(let receivedModel)): XCTAssertEqual(expectedModel, receivedModel, file: file, line: line)
            default: XCTFail("Fail, because expected and received not equal", file: file, line: line)
            }
            expectetion.fulfill()
        }
        action()
        wait(for: [expectetion], timeout: 1)
    }
}

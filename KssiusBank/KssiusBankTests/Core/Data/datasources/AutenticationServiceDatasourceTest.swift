//
//  AutenticationServiceDatasourceTest.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import XCTest
@testable import KssiusBank

final class AutenticationServiceDatasourceTest: XCTestCase {
    var sut: AuthenticationServiceDatasourceProtocol?
    var expectation: XCTestExpectation!
    let apiURL = URL(string: "https://example.com.br/login")!
    let baseUrl = "https://example.com.br"
    
    override func setUp() {

        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)

        sut = AuthenticationServiceDatasource(networkService: .init(urlSession: urlSession))
        expectation = expectation(description: "AutenticationServiceDatasource Expectation")
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Success Response

    func testSuccessResponse() {
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        let modelRequest = LoginRequestModel(username: "user", password: "pass")

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }

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

        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        let modelRequest = LoginRequestModel(username: "user", password: "pass")

        MockURLProtocol.requestHandler = { request in
            throw ServiceError.invalidUrl
        }

        sut?.perform(login: .loginRequest,with: modelRequest){ [weak self] result in
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

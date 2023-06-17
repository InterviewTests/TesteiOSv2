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
    let apiURL = URL(string: "https://example.com.br/login")!
    let baseUrl = "https://example.com.br"

    override func setUp() {

        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)

        sut = AuthenticationServiceDatasource(networkService: .init(urlSession: urlSession))
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Success Response

    func testSuccessResponse() {
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        let modelRequest = LoginRequestModel(username: Seeds.cpf, password: Seeds.password)

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest, with: modelRequest ){ result in
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

        let modelRequest = LoginRequestModel(username: Seeds.cpf, password: Seeds.password)

        MockURLProtocol.requestHandler = { request in
            throw ServiceError.invalidUrl
        }
        let expectation = expectation(description: "Waiting for execute login to complete.")

        sut?.perform(login: .loginRequest,with: modelRequest){ result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")
            case .failure( let error):
                switch( error ){
                case .network( _):
                    XCTAssertEqual(error, BankFailure.network(.init()))
                }
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

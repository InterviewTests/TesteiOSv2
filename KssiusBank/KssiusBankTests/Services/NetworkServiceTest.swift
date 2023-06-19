//
//  NetworkServiceTest.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import XCTest
@testable import KssiusBank

final class NetworkServiceTest: XCTestCase {
    var sut: NetworkService<UserAccountModel>?
    var expectation: XCTestExpectation!
    let apiURL = URL(string: "https://example.com.br/post/42")!
    let baseUrl = "https://example.com.br"

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)

        sut = NetworkService(urlSession: urlSession)
        expectation = expectation(description: "NetworkServiceTest Expectation")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success Response and parse to model

    func testSuccessResponse() {

        let postEndpoint: Endpoint = .init(path:"post/42" , method: .get, configuration: .init(baseUrl: baseUrl))
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }

        sut?.request(endpoint:postEndpoint){ [weak self] result in
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

    // MARK: - Failure Network Response

    func testFailuteNetworkResponse() {
        let postEndpoint: Endpoint = .init(path:"post/42" , method: .get, configuration: .init(baseUrl: baseUrl))
        MockURLProtocol.requestHandler = { request in
            throw ServiceError.invalidUrl
        }
        sut?.request(endpoint: postEndpoint){ [weak self] result in
            switch(result){
            case .success( _):
                XCTFail("Should not return a failure")

            case .failure( let error):
                XCTAssertEqual(error, ServiceError.noData)
            }
            self?.expectation.fulfill()
        }
        wait(for: [self.expectation], timeout: 1.0)
    }
}


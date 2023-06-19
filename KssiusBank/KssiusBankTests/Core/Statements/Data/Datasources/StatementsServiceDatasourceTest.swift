//
//  AutenticationServiceDatasourceTest.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import XCTest
@testable import KssiusBank

final class StatementsServiceDatasourceTest: XCTestCase {
    var sut: StatementsServiceDatasourceProtocol?
    let apiURL = URL(string: "https://example.com.br/statements")!
    let baseUrl = "https://example.com.br"
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)

        sut = StatementsServiceDatasource(networkService: .init(urlSession: urlSession))

    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success Response

    func testSuccessResponse() {
        let data = Seeds.Statements.json.data(using: .utf8)

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        let expectation = expectation(description: "Waiting for fetch statements call to complete.")
        sut?.fetch(statements: .statementsRequest ){ result in
            switch(result){
            case .success(let userModel):
                XCTAssertEqual(userModel.count, 3)
            case .failure( _):
                XCTFail("Should not return a failure")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    // MARK: - Server Error Response

    func testErrorResponse() {

        MockURLProtocol.requestHandler = { request in
            throw ServiceError.invalidUrl
        }
        let expectation = expectation(description: "Waiting for fetch statements call to complete.")
        sut?.fetch(statements: .statementsRequest){ result in
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

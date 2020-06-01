//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Estaife Lima on 31/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Alamofire
import Data

class AlamofireAdapter {
    private let session: Session
   
    init(session: Session = .default) {
        self.session = session
    }
}

extension AlamofireAdapter: HTTPPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HTTPError>) -> Void) {
        session.request(url, method: .post, parameters: data?.json).responseData { dataResponse in
            switch dataResponse.result {
            case .success: break //(let data): completion(.success(data))
            case .failure: completion(.failure(.noConnectivity))
            }
        }
    }
}

class NetworkingTests: XCTestCase {

    func test_post_make_request_with_url_and_method_corect() throws {
        let sut = createSut()
        expectRequestWith(sut: sut, data: dataValid) { (request) in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
        }
    }
    
    func test_post_make_request_when_data_has_been_nil() throws {
        let sut = createSut()
        expectRequestWith(sut: sut, data: nil) { (request) in
            XCTAssertNil(request.httpBodyStream)
        }
    }
    
    func test_post_make_request_to_complete_with_error() throws {
       let sut = createSut()
       let expect = expectation(description: "waiting")
       URLProtocolStub.applySimulateWith(data: nil, response: nil, error: error)
       sut.post(to: url, with: nil) { result in
           switch result {
           case .success: XCTFail("Expected a error and received a \(result)")
           case .failure(let error): XCTAssertEqual(error, .noConnectivity)
           }
           expect.fulfill()
       }
       wait(for: [expect], timeout: 1)
    }
}

extension NetworkingTests {
    
    func createSut(file: StaticString = #file, line: UInt = #line) -> AlamofireAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        memoryLeakCheckWith(instance: sut, file: file, line: line)
        return sut
    }
    
    func expectRequestWith(sut: AlamofireAdapter, data: Data?, completion: @escaping (URLRequest) -> Void) {
        let expect = expectation(description: "waiting")
        sut.post(to: url, with: data) { _ in expect.fulfill() }
        var request: URLRequest!
        URLProtocolStub.observerRequest { request = $0 }
        wait(for: [expect], timeout: 1)
        completion(request)
    }
    
    func expectResultWith(expectResult: (Result<Data?, HTTPError>), andWith stub: (data: Data?, response: HTTPURLResponse?, error: Error?), file: StaticString = #file, line: UInt = #line) {
        //TODO: - build this func expectResultWith
    }
}

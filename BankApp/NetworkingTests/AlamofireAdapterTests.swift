//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Estaife Lima on 31/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Alamofire

class AlamofireAdapter {
    private let session: Session
   
    init(session: Session = .default) {
        self.session = session
    }
    
    func post(to url: URL, with data: Data?) {
        session.request(url, method: .post, parameters: data?.json).resume()
    }
}

class NetworkingTests: XCTestCase {

    func test_post_make_request_with_url_and_method_corect() throws {
        expectWith(sut: createSut(), action: { createSut().post(to: url, with: dataValid) }) { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
        }
    }
    
    func test_post_make_request_when_data_has_been_nil() throws {
        expectWith(sut: createSut(), action: { createSut().post(to: url, with: nil) }) { request in
            XCTAssertNil(request.httpBodyStream)
        }
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
    
    func expectWith(sut: AlamofireAdapter, action: () -> Void, completion: @escaping (URLRequest) -> Void) {
        let expect = expectation(description: "waiting")
        action()
        URLProtocolStub.observerRequest { (request) in
            completion(request)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
    }
}

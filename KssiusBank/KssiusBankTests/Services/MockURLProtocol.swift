//
//  MockURLProtocol.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation


final class MockURLProtocol: URLProtocol {

    // 1. Handler to test the request and return mock response.
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?

    override class func canInit(with request: URLRequest) -> Bool {
        // To check if this protocol can handle the given request.
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        // Here you return the canonical version of the request
        //but most of the time you pass the orignal one.
        return request
    }

    override func startLoading() {
        // This is where you create the mock response
        //as per your test case and send it to the URLProtocolClient.
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler is unavailable.")
        }

        do {
            // 2. Call handler with received request and capture the tuple of response and data.
            let (response, data) = try handler(request)

            // 3. Send received response to the client.
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

            if let data = data {
                // 4. Send received data to the client.
                client?.urlProtocol(self, didLoad: data)
            }

            // 5. Notify request has been finished.
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            // 6. Notify received error.
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {
        // This is called if the request gets canceled or completed.
    }

}

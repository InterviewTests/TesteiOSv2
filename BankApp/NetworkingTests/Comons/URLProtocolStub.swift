//
//  URLProtocolStub.swift
//  NetworkingTests
//
//  Created by Estaife Lima on 31/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

class URLProtocolStub: URLProtocol {
    static var emit: ((URLRequest) -> Void)?
    
    static func observerRequest(completion: @escaping (URLRequest) -> Void) {
        URLProtocolStub.emit = completion
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        URLProtocolStub.emit?(request)
    }

    override func stopLoading() { }
}

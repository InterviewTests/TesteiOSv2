//
//  MockSession.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

final class MockSession {

    static func sessionInstance() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        return  URLSession.init(configuration: configuration)
    }
}

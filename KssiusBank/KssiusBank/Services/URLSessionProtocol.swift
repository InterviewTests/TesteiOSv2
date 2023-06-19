//
//  URLSessionProtocol.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation

protocol URLSessionDataTaskProtocol {
  func resume()
  func cancel()
}

protocol URLSessionProtocol {
  func dataTask(
    with request: URLRequest,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
  ) -> URLSessionDataTask
}

extension URLSession : URLSessionProtocol{}
extension URLSessionDataTask : URLSessionDataTaskProtocol{}

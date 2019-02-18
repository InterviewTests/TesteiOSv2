//
//  API.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

enum Method: String {
  case post = "POST"
  case get = "GET"
}

struct HTTPService {
  static func request(method: Method, baseUrl: URL, path: String, completion: @escaping (() throws -> Data) -> Void) {
    let parameters: Data? = nil
    request(method: method, baseUrl: baseUrl, path: path, parameters: parameters, completion: completion)
  }

  static func request<T>(method: Method,
                         baseUrl: URL,
                         path: String,
                         parameters: T?,
                         completion: @escaping (() throws -> Data) -> Void) where T: Encodable {
    guard var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true) else { return }
    urlComponents.path = path
    guard let url = urlComponents.url else { return }
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    do {
      if let parameters = parameters {
        request.httpBody = try JSONEncoder().encode(parameters)
      }
      URLSession.shared.dataTask(with: request) { data, _, err in
        if let data = data {
          completion { data }
        } else if let err = err {
          completion { throw err }
        } else {
          completion { throw ServiceError.unknown }
        }
      }.resume()
    } catch {
      completion { throw error }
    }
  }
}

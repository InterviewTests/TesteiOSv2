//
//  HTTRequest.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation
struct HTTRequest<T : Codable> {
    
    typealias HTTPNewtorkingSuccess  = (T?)-> Swift.Void
    typealias HTTPNewtorkingFailure  = (NSError)-> Swift.Void
    typealias HTTPNetworkingDataTask = (Data?, URLResponse?, Error?)-> Swift.Void
    
    var requestable : HTTPRequestable

    func get(success : @escaping HTTPNewtorkingSuccess, failure : @escaping HTTPNewtorkingFailure) {
        var request = URLRequest(url: requestable.url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requestable.headers

        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            self.responseHandler(success: success, failure: failure)(data, response, error)
        }
        session.resume()
    }

    
    func post(success : @escaping HTTPNewtorkingSuccess, failure : @escaping HTTPNewtorkingFailure) {
        
        var request = URLRequest(url: requestable.url)
        request.httpMethod  = "POST"
        request.allHTTPHeaderFields = requestable.headers
        request.httpBody = encodeParams(params: requestable.params)
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.responseHandler(success: success, failure: failure)(data, response, error)
        }
        session.resume()
        
    }
    
    private func responseHandler(success : @escaping HTTPNewtorkingSuccess, failure : @escaping HTTPNewtorkingFailure)-> HTTPNetworkingDataTask {
        return { data, response, error in
            
            if error != nil {
                DispatchQueue.main.async {
                    failure(error! as NSError)
                    return
                }
            }
            
            do {
                let decoder = JSONDecoder()
                let json = try data.map {
                    return try decoder.decode(T.self, from: $0)
                }
                DispatchQueue.main.async {
                    success(json)
                }
            }catch let error {
                DispatchQueue.main.async {
                    print(error)
                    failure(error as NSError)
                }
            }
        }
    }
    
    public func encodeParams(params:[String: Any]) -> Data? {
        guard let jsonData = params.queryFormat().data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        return jsonData
    }

}

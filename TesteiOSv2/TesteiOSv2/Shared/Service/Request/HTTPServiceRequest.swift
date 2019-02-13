//
//  Request.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

struct HTTPServiceRequest<T:Codable> {
    
    typealias HTTPServiceRequestWithSuccess = (T?) -> Void
    typealias HTTPServiceRequestWithError  = (Error) -> Void
    typealias HTTPServiceRequestResponse = (Data?, URLResponse?, Error?) -> Void
    
    func postRequest(servicePath: HTTPServicePaths, parameters: [String: Any]? = nil, success: @escaping HTTPServiceRequestWithSuccess, failure : @escaping HTTPServiceRequestWithError) {
        
        guard let url = URL(string: HTTPServicePaths.BASE_URL.description+servicePath.description) else {return}
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters as Any, options: []) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.POST.description
        request.httpBody = httpBody
        request.addValue(RequestHeaderMethod.json.description, forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            self.responseHandler(success: success, failure: failure)(data, response, error)
        }
        
        task.resume()
    }
    
    func getRequest(success: @escaping HTTPServiceRequestWithSuccess, failure : @escaping HTTPServiceRequestWithError, servicePath: HTTPServicePaths) {
        
        guard let url = URL(string: HTTPServicePaths.BASE_URL.description+servicePath.description) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.GET.description
        request.addValue(RequestHeaderMethod.json.description, forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            self.responseHandler(success: success, failure: failure)(data, response, error)
            
        }
        
        task.resume()
    }
    
    private func responseHandler(success : @escaping (T?)->Void, failure : @escaping HTTPServiceRequestWithError) -> HTTPServiceRequestResponse {
        
        let handler: HTTPServiceRequestResponse = ({ data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    failure(error!)
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
                    failure(error)
                }
            }
        })
        
        return handler
    }
    
    init() {
        
    }
}

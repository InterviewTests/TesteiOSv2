//
//  Request.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

struct  HttpRequest<T:Codable> {
    
    typealias HTTPNetworkingDataTask = (Data?, URLResponse?, Error?)-> Swift.Void
        
    func postRequest(servicePath: ServicePath, parameters: [String: Any]? = nil, success: @escaping (T?)->Void, failure : @escaping (NSError)-> Void) {
        
        guard let url = URL(string: ServicePath.BASE_URL.description+servicePath.description) else {return}
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        
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
    
    func getRequest(success: @escaping (T?)->Void, failure : @escaping (NSError)-> Void, servicePath: ServicePath) {
        
        guard let url = URL(string: ServicePath.BASE_URL.description+servicePath.description) else {return}
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
    
    private func responseHandler(success : @escaping (T?)->Void, failure : @escaping (NSError)-> Void)-> HTTPNetworkingDataTask {
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
    
    init() {
        
    }
}

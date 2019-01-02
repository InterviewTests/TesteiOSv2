//
//  BankAPINetwork.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 02/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

extension BankAPI {
    
    func urlRequest(type: RequestType, params: Data?, completionHandler: @escaping (Data?) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = urlScheme
        urlComponents.host = urlHost
        urlComponents.path = urlPath
        
        if let url = urlComponents.url {
            var request = URLRequest(url: url)
            request.httpMethod = type.rawValue
            
            var headers = request.allHTTPHeaderFields ?? [:]
            headers["Content-Type"] = "application/json"
            request.allHTTPHeaderFields = headers
            
            if let _params = params {
                request.httpBody = _params
            }
            
            print(request)
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, urlResponse, taskError) in
                DispatchQueue.main.async {
                    
                    if let _error = taskError {
                        print(_error)
                        completionHandler(nil)
                        
                    } else if let jsonData = data {
                        completionHandler(jsonData)
                    }
                }
            }
            task.resume()
        }
        else {
            fatalError("Could not create URL from components")
        }
    }
    
    func catchNetworkError(_ data: Data?) {
        guard let data = data else { return }
        let error = try? JSONSerialization.jsonObject(with: data, options: [])
        print(error)
    }
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

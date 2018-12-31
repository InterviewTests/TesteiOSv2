//
//  BankAPI.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

class BankAPI: BankAPIProtocol {
    
    /**
     * Documentation for this class:
     * https://hackernoon.com/everything-about-codable-in-swift-4-97d0e18a2999
     * https://www.raywenderlich.com/567-urlsession-tutorial-getting-started
     * https://medium.com/@sdrzn/networking-and-persistence-with-json-in-swift-4-c400ecab402d
     */
    
    private var urlHost = "bank-app-test.herokuapp.com"
    private var urlScheme = "https"
    private var urlPath = ""
    
    var parameters: [[String: String]]? = []
    
    func loginUser(login: UserLogin, completionHandler: @escaping (UserResponse?) -> Void) {
        
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(login)
        
        // try request
        urlPath = "/api/login"
        urlRequest(type: .post, params: jsonData) { (responseData) in
            if let jsonData = responseData {
                do {
                    let response = try JSONDecoder().decode(UserResponse.self, from: jsonData)
                    if let bankError = response.error, bankError.code != nil {
                        completionHandler(response)
                        print(bankError)
                    }
                    else if let _ = response.userAccount {
                        completionHandler(response)
                    }
                } catch {
                    self.catchNetworkError(responseData)
                    completionHandler(nil)
                }
            }
            else {
                self.catchNetworkError(responseData)
                completionHandler(nil)
            }
        }
    }
}

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

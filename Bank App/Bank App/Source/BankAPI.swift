//
//  BankAPI.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

class BankAPI: BankAPIProtocol {
    
    private var urlHost = "bank-app-test.herokuapp.com"
    private var urlScheme = "https"
    private var urlPath = ""
    
    var parameters: [[String: String]]? = []
    
    func loginUser(login: UserLogin, completionHandler: @escaping (UserResponse?) -> Void) {
        
        // prepare params
        prepareParams(value: login.user, key: UserLogin.CodingKeys.user)
        prepareParams(value: login.password, key: UserLogin.CodingKeys.password)
        
        // try request
        urlPath = "/api/login"
        urlRequest(type: .post, params: parameters) { (responseData) in
            if let jsonData = responseData {
                do {
                    let response = try JSONDecoder().decode(UserResponse.self, from: jsonData)
                    if let bankError = response.error {
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
    
    func urlRequest(type: RequestType, params: [[String: String]]?, completionHandler: @escaping (Data?) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = urlScheme
        urlComponents.host = urlHost
        urlComponents.path = urlPath
        
        if let url = urlComponents.url {
            var request = URLRequest(url: url)
            request.httpMethod = type.rawValue
            
            if let _params = params {
                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                if let httpBody = try? JSONSerialization.data(withJSONObject: _params, options: []) {
                    request.httpBody = httpBody
                }
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
    
    func prepareParams(value: Any?, key: CodingKey) {
        guard let value = value else { return }
        if "\(value)" == "" { return }
        let param = [key.stringValue : "\(value)"]
        self.parameters?.append(param)
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

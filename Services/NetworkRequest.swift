//
//  NetworkRequest.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 27/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation

class NetworkRequest: NSObject {
    static let shared = NetworkRequest()
    
    func send(endPoint: String, httpMethod: Constants.httpMethod, additionalHeaders: [String: String]?, parameters: [String: String]?, completionSuccess: @escaping (Data) -> Void, completionError: @escaping (Int) -> Void, completionParsingError: @escaping (String) -> Void){
        
        let session = URLSession.shared
        var request: URLRequest!
        var postString: String!
        
        if let url = URL(string: endPoint){
            request = URLRequest(url: url)
        }
        
        // method
        request.httpMethod = httpMethod.rawValue

        // headers
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        if let additionalHeaders = additionalHeaders{
            for additionalHeader in additionalHeaders{
                request.addValue(additionalHeader.value, forHTTPHeaderField: additionalHeader.key)
            }
        }

        if httpMethod == .POST{
            // body
            if let parameters = parameters{
                postString = String()

                for parameter in parameters{
                    if postString == ""{
                        postString = postString + parameter.key + "=" + parameter.value
                    } else {
                        postString = postString + "&" + parameter.key + "=" + parameter.value
                    }
                }
                
                request.httpBody = postString.data(using: .utf8)
            }
        }
        
        let task = session.dataTask(with: request) { (data, res, error) in
            
            if let httpResponse = res as? HTTPURLResponse {
                if httpResponse.statusCode > 399{
                    completionError(httpResponse.statusCode)
                    return
                }
                print("statusCode: \(httpResponse.statusCode)")
            }
            
            if let d = data {
                completionSuccess(d)
                return
            } else {
                completionParsingError("Breakpoint here")
                return
            }
        }
        
        task.resume()
        
    }

}



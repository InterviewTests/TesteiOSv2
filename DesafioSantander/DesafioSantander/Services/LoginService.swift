//
//  LoginService.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

class LoginService {
    
    func login(parameters: Data?, completionHandler:@escaping( (Data?, URLResponse?, Error?) -> Void )) {
        let uri = URL(string: "https://bank-app-test.herokuapp.com/api/login")
        
        let headers: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
        
        var request = URLRequest(url: uri!)
        request.allHTTPHeaderFields = headers
        request.httpBody = parameters
        request.httpMethod = HTTPMethods.post
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
}

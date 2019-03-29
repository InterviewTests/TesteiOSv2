//
//  AccountService.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

class AccountService {
    
    func statements(userId: Int, completionHandler:@escaping( (Data?, URLResponse?, Error?) -> Void )) {
        let uri = URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(userId)")
        let headers: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
        
        var request = URLRequest(url: uri!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = HTTPMethods.get
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
}

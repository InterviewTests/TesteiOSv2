//
//  LoginService.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

class LoginService: LoginProtocol {
    
    // MARK: LoginService
    
    func login(_ login: String, password: String, completionHandler: @escaping (User?) -> Void) {
    
        var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/login")!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyData = "user=\(login)&password=\(password)"
        request.httpBody = bodyData.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                print(request)
                
                //verify response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{
                        guard let data = data else {return}
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let user = json["userAccount"] as? [String: Any] {
                                    let userData = try JSONSerialization.data(withJSONObject: user, options: [])
                                    let decoder = JSONDecoder()
                                    let userAux = try decoder.decode(User.self, from: userData)
                                    
                                    completionHandler(userAux)
                                }
                            }
                        } catch let jsonErr {
                            print("Error serializing json", jsonErr)
                        }
                    }
                }
            }
        })

        task.resume()
    }
}

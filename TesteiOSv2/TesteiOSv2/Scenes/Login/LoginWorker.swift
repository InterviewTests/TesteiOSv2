//
//  LoginWorker.swift
//  TesteiOSv2
//
//  Created by Lucas Saito on 06/05/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

class LoginWorker {
    func requestLogin(request: LoginModel.Request, completionSuccess: @escaping (LoginModel.Response) -> Void, completionError: @escaping (Error) -> Void)
    {
        let params = request.getBodyRequest()
        let urlRequest = "https://bank-app-test.herokuapp.com/api/login"
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if let error = error {
                DispatchQueue.main.async {
                    completionError(error)
                }
            } else {
                guard let data = data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(LoginModel.Response.self, from: data)

                    DispatchQueue.main.async {
                        completionSuccess(responseModel)
                    }
                } catch {
                    print("JSON Serialization error")
                    print(error)
                }
            }
        }).resume()
    }
}

//
//  ApiRequest.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 21/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import Foundation

class ApiRequest {
    
    let urlBaseString = "https://bank-app-test.herokuapp.com/api/"
    
    func doLogin(userLogin: Login.Request, completion: @escaping (ApiResult<Data>) -> Void) {
        
        let urlString = urlBaseString + "login"
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "user=\(userLogin.user)&password=\(userLogin.password)".data(using: .utf8)

        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            guard let dataResponse = data else {
                completion(.failure(.brokenData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown("Could not cast to HTTPURLResponse")))
                return
            }
            
            switch httpResponse.statusCode {
                case 200...299:
                    completion(.success(dataResponse))
                    
                case 403:
                    completion(.failure(.authenticationRequired))

                case 404:
                    completion(.failure(.couldNotFindHost))

                case 500:
                    completion(.failure(.badRequest))

                default:
                    completion(.failure(.unknown("")))
            }
            
        }.resume()
    }
}

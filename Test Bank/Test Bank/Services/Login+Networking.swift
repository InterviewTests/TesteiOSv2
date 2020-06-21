//
//  Login+Networking.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 21/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import Foundation



struct LoginNetworking {
    
    let urlString = "https://bank-app-test.herokuapp.com/api/login"
    static let shared = LoginNetworking()
    
    func doLogin(userLogin: Login.Request, completion: @escaping (Result<Login.Response, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "user=\(userLogin.user)&password=\(userLogin.password)".data(using: .utf8)

        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            
            if let err = error {
                completion(.failure(err))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                print(httpResponse.statusCode)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Login.Response.self, from: data)
                completion(.success(json))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }
}

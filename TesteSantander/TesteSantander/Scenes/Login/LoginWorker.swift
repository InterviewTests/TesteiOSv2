//
//  LoginWorker.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import Foundation

typealias LoginResponseSuccess = (_ response: LoginModel.Login.Response) -> ()
typealias LoginResponseFailure = (_ response: String) -> ()


class LoginWorker {
    private func createRequest(requestData: LoginModel.Login.Request, urlRequest: URL) -> URLRequest {
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        request.httpBody = requestData.getBody().data(using: .utf8)
        
        return request
    }
    
    func validateUserName(username: String) -> Bool {
        return username.isValidCpf() || username.isValidRegex(regex: Constants.Regex.emailRegex)
    }
    
    func validatePassword(password: String) -> Bool {
        return password.isValidRegex(regex: Constants.Regex.capitalLetterRegex) && password.isValidRegex(regex: Constants.Regex.numberRegex) && password.isValidRegex(regex: Constants.Regex.specialCharacterRegex)
    }
    
    func login(requestData: LoginModel.Login.Request, completionSuccess: @escaping LoginResponseSuccess, completionFailure: @escaping LoginResponseFailure) {
        guard let urlRequest = URL(string: Constants.Url.login) else { return }
        let request = createRequest(requestData: requestData, urlRequest: urlRequest)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            guard let user = User.parse(responseData: data) else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            completionSuccess(LoginModel.Login.Response(user: user))
        }.resume()
    }
}

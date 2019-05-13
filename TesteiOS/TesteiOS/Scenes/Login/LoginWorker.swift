//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

typealias LoginResponseSuccess = (_ response: LoginModel.Login.Response) -> ()
typealias LoginResponseFailure = (_ response: String) -> ()

class LoginWorker {
    func postLogin(requestData: LoginModel.Login.Request, urlRequest: URL) -> URLRequest {
        
        var urlRequest = URLRequest(url: urlRequest)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = requestData.getBody().data(using: .utf8)
        
        return urlRequest
    }
    
    func validatePassword(password: String) -> Bool {
        return password.validateRegex(pattern: Constants.Regex.capitalLetterRegex) && password.validateRegex(pattern: Constants.Regex.numberRegex) && password.validateRegex(pattern: Constants.Regex.specialCharacterRegex)
    }
    
    func validateUserId(userId: String) -> Bool {
        return userId.validateRegex(pattern: Constants.Regex.emailRegex) || userId.validateCpf()
    }
    
    func login(requestData: LoginModel.Login.Request, completionSuccess: @escaping LoginResponseSuccess, completionFailure: @escaping LoginResponseFailure) {
        guard let urlRequest = URL(string: Constants.URL.loginUrl) else { return }
        let request = postLogin(requestData: requestData, urlRequest: urlRequest)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("error while POST Login")
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data,
                let user = UserAccount.parse(data) else {
                    completionFailure(error?.localizedDescription ?? "")
                    return
            }
            completionSuccess(LoginModel.Login.Response(user: user))
        }.resume()
    }
}

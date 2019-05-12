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
    let manager = ApiManager()
    
    func login(requestData: LoginModel.Login.Request, completionSuccess: @escaping LoginResponseSuccess, completionFailure: @escaping LoginResponseFailure) {
        manager.performLogin(requestData: requestData) { (data, error) in
            guard let _ = error else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            guard let user = User.parse(responseData: data) else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            completionSuccess(LoginModel.Login.Response(user: user))
        }
    }
}

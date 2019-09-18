//
//  LoginRequest.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation
import Alamofire

class LoginRequest: BaseRequest {
    
    var loginData: LoginModel.loginInfo?
    
    init(data: LoginModel.loginInfo) {
        self.loginData = data
    }
    
    var endpoint: String {
        return "https://bank-app-test.herokuapp.com/api/login"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var body: [String : Any] {
        if let info = loginData {
            let body = [ "user" : info.user,
                         "password" : info.password ]
            return body as [String : Any]
        }
        
        return [:]
    }
    
    var headers: HTTPHeaders {
        return [:]
    }

}

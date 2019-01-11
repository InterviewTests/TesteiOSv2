//
//  LoginModels.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

enum Login {
    struct LoginFormFields {
        var user: String
        var password: String
    }
    
    enum LoginUser {
        struct Request {
            var loginFormFields: LoginFormFields
        }
        
        struct Response {
            var user: User?
        }
        
        struct ViewModel {
            var user: User?
        }
    }
}

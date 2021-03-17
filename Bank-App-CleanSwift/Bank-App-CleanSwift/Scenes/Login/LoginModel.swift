//
//  LoginModel.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

enum Login {
    struct LoginFields {
        var username: String
        var password: String
    }
    
    enum Login {
        struct Request {
            var fields: LoginFields
        }
        
        struct Response {
            var user: UserAccount?
            var error: ErrorMessage?
        }
        
        struct ViewModel {
            var user: UserAccount?
            var error: ErrorMessage?
        }
    }
}

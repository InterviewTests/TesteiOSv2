//
//  LoginModels.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//
//

import UIKit

enum LoginModel {
    enum Login {
        struct Request {
            let user: String?
            let password: String?
            
            func getBody() -> String {
                return "user=\(user ?? "")&password=\(password ?? "")"
            }
        }
        
        struct Response {
            let user: User?
        }
        
        struct ViewModel {
            let name: String
            let bankAccount: String
            let agency: String
            let balance: Double
        }
    }
}

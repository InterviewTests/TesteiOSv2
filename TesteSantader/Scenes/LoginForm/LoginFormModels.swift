//
//  LoginFormModels.swift
//  TesteSantader
//
//  Created by Bruno Chen on 05/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

enum LoginForm {
    // MARK: - Use cases
    enum Login {
        
        struct Request {
            var userID: String?
            var password: String?
        }
        struct Response {
            var success: Bool
        }
        struct ViewModel {
            var success: Bool
        }
    }
}

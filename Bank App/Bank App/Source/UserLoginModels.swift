//
//  UserLoginModel.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/11/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

enum UserLogin {
    
    enum FetchUser {
        
        struct Resquest {
            // ...
        }
        
        struct Response {
            // ...
        }
        
        struct ViewModel {
            
            struct DisplayUser {
                var userId: Int
                var name: String
                var bankAccount: String
                var agency: String
                var balance: Int
            }
            var User: DisplayUser
        }
    }
}

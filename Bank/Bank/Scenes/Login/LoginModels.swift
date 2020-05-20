//
//  LoginModels.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit



enum Login {
    
    struct Request: BankCodable {
        var user: User?
    }
    
    struct Response  {
        var userLogin: UserLogin?
        var error: ErrorHandler?
        var user: User?
    }
    
    struct ViewModel  {
        var userLogin: UserLogin?
        var error: ErrorHandler?
        var user: User?

    }
}

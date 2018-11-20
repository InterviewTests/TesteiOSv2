//
//  LoginModels.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

enum Login {
    struct Request {
        var userName: String?
        var password: String?
    }
    struct Response {
        var isError: Bool
        var message: String?
        var user: User?
    }
        
    struct ViewModelFailedLogin {
        var message: String
    }
    struct ViewModelSuccessfullLogin {}
}



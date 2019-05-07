//
//  LoginModel.swift
//  TesteiOSv2
//
//  Created by Lucas Saito on 06/05/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

enum LoginModel {
    struct Request {
        let user: String?
        let password: String?
    }
    
    struct Response {
        let errorMessage: String?
    }
}

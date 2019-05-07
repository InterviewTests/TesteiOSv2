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
        
        func getBodyRequest() -> String {
            return "user=\(user ?? "")&password=\(password ?? "")"
        }
    }
    
    struct Response: Decodable {
        let userAccount: UserAccount?
        let error: Error?
    }
    
    struct UserAccount: Decodable {
        let userId: Int?
        let name: String?
        let bankAccount: String?
        let agency: String?
        let balance: Double?
    }
    
    struct Error: Decodable {
        
    }
}

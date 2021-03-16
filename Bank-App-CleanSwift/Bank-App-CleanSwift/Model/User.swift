//
//  User.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

struct User {
    let username: String
    let password: String
}

// MARK: -
/// Struct for request body parameters
struct UserParameters: Encodable {
    let user: String
    let password: String
}


// MARK: -
/// Struct for decoding data
struct UserData: Decodable {
    let error: ErrorData?
    let userAccount: UserAccountData?
    
    struct ErrorData: Decodable {
        let code: Int
        let message: String
        
        enum CodingKeys: String, CodingKey {
            case code
            case message
        }
    }
    
    struct UserAccountData: Decodable {
        let userId: Int
        let name: String
        let bankAccount: String
        let agency: String
        let balance: Double
        
        enum CodingKeys: String, CodingKey {
            case userId
            case name
            case bankAccount
            case agency
            case balance
        }        
    }
}

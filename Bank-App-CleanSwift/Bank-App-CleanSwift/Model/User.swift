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
    let error: ErrorData
    let userAccount: UserAccountData
    
    struct ErrorData: Decodable {
        let code: Int?
        let message: String?
        
        enum CodingKeys: String, CodingKey {
            case code
            case message
        }
    }
    
    struct UserAccountData: Decodable {
        let userId: Int?
        let name: String?
        let bankAccount: String?
        let agency: String?
        let balance: Double?
        
        enum CodingKeys: String, CodingKey {
            case userId
            case name
            case bankAccount
            case agency
            case balance
        }        
    }
}

// MARK: - structs for use in response

/// Marker protocol, used for polimorphism.
protocol JSONDataExtractable {
    func extractData(from userData: UserData)
}


/// Class for use when a request was made with correct parameters.
class UserAccount: JSONDataExtractable {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
    
    func extractData(from userData: UserData) {
        self.userId = userData.userAccount.userId
        self.name = userData.userAccount.name
        self.bankAccount = userData.userAccount.bankAccount
        self.agency = userData.userAccount.agency
        self.balance = userData.userAccount.balance
    }
}


/// Class for use when a request was made wth incorrect parameters.
class ErrorMessage: JSONDataExtractable {
    var code: Int?
    var message: String?
    
    func extractData(from userData: UserData) {
        self.code = userData.error.code
        self.message = userData.error.message
    }
}


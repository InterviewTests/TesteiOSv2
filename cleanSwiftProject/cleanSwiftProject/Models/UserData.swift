//
//  UserData.swift
//  cleanSwiftProject
//
//  Created by santosw ios samel on 01/05/21.
//

import Foundation


struct UserGetData: Decodable {
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


protocol JSONDataExtractable {}

class UserAccountData:JSONDataExtractable {
    
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
    
    init(extractedFrom userData: UserGetData) {
        self.userId = userData.userAccount.userId
        self.name = userData.userAccount.name
        self.bankAccount = userData.userAccount.bankAccount
        self.agency = userData.userAccount.agency
        self.balance = userData.userAccount.balance
    }

    init(userId: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}

class UserDataErrorMessage: JSONDataExtractable {
    var code: Int?
    var message: String?

    init(extractedFrom userData: UserGetData) {
        self.code = userData.error.code
        self.message = userData.error.message
    }
    
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}


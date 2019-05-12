//
//  User.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import Foundation

struct User: Codable {
    let userAccount: UserAccount?
    let error: LoginError?
}

struct UserAccount: Codable {
    let userID: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
}

struct LoginError: Codable { }

extension User {
    static func parse(responseData: Data?) -> User? {
        var user: User?
        guard let data = responseData else { return user }
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(User.self, from: data)
        } catch let err {
            print("Error: ", err)
        }
        
        return user
    }
}

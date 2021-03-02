//
//  Constants.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import Foundation

struct LOGIN_EXAMPLE {
    static let USER = "test_user"
    static let PASSWORD = "Test@1"
    
    let parameters: [String: String] = [
        "user": USER,
        "password": PASSWORD
    ]
}

struct URLS {
    static let LOGIN_ENDPOINT = "https://bank-app-test.herokuapp.com/api/login"
}

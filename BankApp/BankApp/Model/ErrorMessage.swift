//
//  ErrorLogin.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 03/03/21.
//

import Foundation

struct ErrorMessage: FetchedData {
    let code: Int
    let message: String
    
    init(from errorData: UserLoginData.ErrorData) {
        self.code = errorData.code!
        self.message = errorData.message!
    }
}

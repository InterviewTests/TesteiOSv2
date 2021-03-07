//
//  ErrorMessage.swift
//  BankApp
//  Struct model, that represent a default error message and is made from data received from post request if the user does not exist. It implements the protocol FetchedData.

//  Created by Adriano Rodrigues Vieira on 03/03/21.
//

import Foundation

struct ErrorMessage: FetchableData {
    let code: Int
    let message: String
    
    /// Creates an ErrorMessage based on data fetched from POST request
    /// - parameters errorData: an ErrorData object
    init(from errorData: UserLoginData.ErrorData) {
        self.code = errorData.code!
        self.message = errorData.message!
    }
}

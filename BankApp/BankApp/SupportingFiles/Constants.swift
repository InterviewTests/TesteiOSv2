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
    static let NAME = "Jose da Silva Teste"
    
    static let USER_PARAMETERS = UserLoginCredentialsData(user: USER, password: PASSWORD)
        
    static let MOCK_USERLOGIN_DATA = UserLoginData(error: UserLoginData.ErrorData(code: 100,
                                                                                  message: "Your code is wrong"),
                                                   userAccount: UserLoginData.UserAccountData(userId: 123,
                                                                                              name: "John Appleseed",
                                                                                              bankAccount: "010101",
                                                                                              agency: "213",
                                                                                              balance: 0.0))            
}

struct URLS {
    static let LOGIN_ENDPOINT = "https://bank-app-test.herokuapp.com/api/login/"
}

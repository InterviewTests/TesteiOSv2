//
//  Constants.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import Foundation

struct USER_EXAMPLE {
    static let USER = "test_user"
    static let PASSWORD = "Test@1"
    static let NAME = "Jose da Silva Teste"
        
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

struct TESTING_DATA {
    static let USER_PARAMETERS = UserLoginCredentialsParameters(user: USER_EXAMPLE.USER, password: USER_EXAMPLE.PASSWORD)
    
    static let VALID_CPF = "231.481.700-16"
    static let INVALID_CPF_NUMBERS_EQUAL = "111.111.111-11"
    static let INVALID_CPF_MISSING_NUMBER = "231.481.700-1"
    static let INVALID_CPF_JUNK_TEXT = "Mombojombo"
    static let INVALID_CPF_WRONG_SEQUENCE_NUMBER = "231.481.700-15"
    
    static let VALID_EMAIL = "joao.sembraco@outlook.com"
    static let INVALID_EMAIL = "mombojombo"
    
    static let VALID_PASSWORD = "Test5!"
    static let VALID_PASSWORD_MORE_THAN_SIX_DIGITS = "i_Am_1_Long_Password_with_2_numbers!!!@#$%"
    static let INVALID_PASSWORD_FIVE_DIGITS = "Tes5!"
    static let INVALID_PASSWORD_NO_NUMBER = "Testi!"
    static let INVALID_PASSWORD_NO_CHARACTER = "Test51"
    static let INVALID_PASSWORD_NO_CAPITALIZED = "test5!"
    static let INVALID_PASSWORD_BLANK = ""
}

struct REGEX_PATTERNS {
    static let CPF = "[0-9]{3}\\.?[0-9]{3}\\.?[0-9]{3}\\-?[0-9]{2}"
    static let EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let PASSWORD = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$"
}

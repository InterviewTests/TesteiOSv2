//
//  LoginDouble.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

enum LoginDoubles {
    // Happy path (when username and password matches the predicates)
    static let USER_WITH_GOOD_EMAIL_AND_GOOD_PASSWORD = User(username: "john.appleseed@accenture.com", password: "Test@1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(username: "15560606022", password: "Test@1")
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(username: "155.606.060-22", password: "Test@1")

    // When the user is correct but the password does not have a uppercased letter
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER =
        User(username: "155.606.060-22", password: "test@1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER =
        User(username: "15560606022", password: "test@1")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER =
        User(username: "john.appleseed@accenture.com", password: "test@1")
        
    // When the user is correct but the password does not have a special character
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER =
        User(username: "155.606.060-22", password: "Testa1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER =
        User(username: "15560606022", password: "Testa1")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER = User(username: "john.appleseed@accenture.com", password: "Testa1")
        
    // When the user is correct but the password does not have a number
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_NUMBER =
        User(username: "155.606.060-22", password: "Test@i")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_NUMBER =
        User(username: "15560606022", password: "Test@i")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_NUMBER = User(username: "john.appleseed@accenture.com", password: "Test@i")
    
    // When the user is correct but the password does not contain at least 6 digits
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS =
        User(username: "155.606.060-22", password: "Tes@1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS =
        User(username: "15560606022", password: "Tes@1")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS =
        User(username: "john.appleseed@accenture.com", password: "Tes@1")
    
    
    
    // When the user is correct but the password is blank
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_BLANK_PASSWORD = User(username: "155.606.060-22", password: "")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BLANK_PASSWORD = User(username: "15560606022", password: "")
    static let USER_WITH_GOOD_EMAIL_AND_BLANK_PASSWORD = User(username: "john.appleseed@accenture.com", password: "")
    
    // When the user is correct but the password does not match any of password predicates
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(username: "155.606.060-22", password: "asdf")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(username: "15560606022", password: "asdf")
    static let USER_WITH_GOOD_EMAIL_AND_BAD_PASSWORD = User(username: "john@appleseed@accenture.com", password: "asdf")
        
    // Only password valid
    static let USER_WITH_BAD_EMAIL_AND_GOOD_PASSWORD = User(username: "john.appleseed", password: "Test@1")
    static let USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(username: "11111111111", password: "Test@1")
    static let USER_WITH_BAD_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(username: "111.111.111-11", password: "Test@1")
    static let USER_WITH_RANDOM_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(username: "987.654.321-09", password: "Test@1")
    static let USER_WITH_RANDOM_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(username: "98765432109", password: "Test@1")
    static let USER_WITH_BLANK_USER_AND_GOOD_PASSWORD = User(username: "", password: "Test@1")
    
    // User and password invalid
    static let USER_WITH_BLANK_FIELDS = User(username: "", password: "")
    static let USER_WITH_BAD_EMAIL_AND_BAD_PASSWORD = User(username: "john.appleseed", password: "aaa")
    static let USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(username: "11111111111", password: "aaa")
    static let USER_WITH_BAD_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(username: "111.111.111-11", password: "aaa")
    static let USER_WITH_RANDOM_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(username: "987.654.321-09", password: "aaa")
    static let USER_WITH_RANDOM_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(username: "98765432109", password: "aaa")
}

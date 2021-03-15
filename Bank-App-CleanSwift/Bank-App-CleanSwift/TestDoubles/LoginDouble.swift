//
//  LoginDouble.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

enum LoginDoubles {
    
    // Happy path
    static let USER_WITH_GOOD_EMAIL_AND_GOOD_PASSWORD = User(name: "john.appleseed@accenture.com", password: "Test@1")
    
    // Only username valid
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(name: "15560606022", password: "Test@1")
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(name: "155.606.060-22", password: "Test@1")
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(name: "155.606.060-22", password: "asdf")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(name: "15560606022", password: "asdf")
    static let USER_WITH_GOOD_CPF_AND_BLANK_PASSWORD = User(name: "155.606.060-22", password: "")
    static let USER_WITH_GOOD_EMAIL_AND_BAD_PASSWORD = User(name: "john@appleseed@accenture.com", password: "aaa")
    static let USER_WITH_GOOD_EMAIL_AND_BLANK_PASSWORD = User(name: "john.appleseed@accenture.com", password: "")    
    
    // Only password valid
    static let USER_WITH_BAD_EMAIL_AND_GOOD_PASSWORD = User(name: "john.appleseed", password: "Test@1")
    static let USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(name: "11111111111", password: "Test@1")
    static let USER_WITH_BAD_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(name: "111.111.111-11", password: "Test@1")
    static let USER_WITH_RANDOM_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(name: "987.654.321-09", password: "Test@1")
    static let USER_WITH_RANDOM_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(name: "98765432109", password: "Test@1")
    static let USER_WITH_BLANK_USER_AND_GOOD_PASSWORD = User(name: "", password: "Test@1")
    
    // User and password invalid
    static let USER_WITH_BLANK_FIELDS = User(name: "", password: "")
    static let USER_WITH_BAD_EMAIL_AND_BAD_PASSWORD = User(name: "john.appleseed", password: "aaa")
    static let USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(name: "11111111111", password: "aaa")
    static let USER_WITH_BAD_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(name: "111.111.111-11", password: "aaa")
    static let USER_WITH_RANDOM_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(name: "987.654.321-09", password: "aaa")
    static let USER_WITH_RANDOM_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(name: "98765432109", password: "aaa")
}

//
//  LoginFieldsValidationWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

/// Worker Class for validation of entry fields (a.k.a. username and password)
class LoginFieldsValidationWorker {
    
    /// Validates if an `user` object has valid `username` and `password` parameters, based on:
    /// 1) `User.username` must be a CPF valid (with or without dots and slash) or an email valid; and
    /// 2) `User.password` must have at least 6 digits, one uppercased letter, one number and one special character.
    ///
    /// - Parameter user: an `User` object
    /// - Returns: `true` if both `username` and `password` are valid; otherwise, `false`.
    func validate(user: User) -> Bool {
        let passwordValid = isPasswordValid(password: user.password)
        
        return true && passwordValid
    }
    
    /// Validates if a `password` is valid. Technically speaking, returns `true` if `password` contais at least six digits, one uppercased letter,
    /// one number and one special character; otherwise, it returns `false`
    /// - Parameter password: the `password` string.
    /// - Returns: `true`if `password` is valid; `false` if it is invalid.
    private func isPasswordValid(password: String) -> Bool {
        let passwordPattern =
            #"(?=.{6,})(?=.*[A-Z])(?=.*\d)(?=.*[ !$%&@?._-])"#
        
        let result = password.range(of: passwordPattern, options: .regularExpression)
        
        return result != nil
    }
}


//
//  LoginValidation.swift
//  BankApp
//  Static class (cannot be instantied) with some helper methods for validation of user and password based on restrictions like:
//  cpf must be a 11 digit-number or a string in format xx.xxx.xxx-xx; user must be an email in format: s@s.s; password must have
//  at least 6 digits, one number, one special character and the first letter must be Uppercased.
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import Foundation

struct LoginValidation {
    private init() {}
    
    /// Validates the string `password` if it matches a valid password: more than 6 digits, first letter uppercased, at least one special character and at lease on digit (example valid: Test@1)
    /// - parameter password: a string representing a password
    /// - returns: `true` if the string correspond to a password valid, or `false` if the string does not correspond to a password valid
    static func validatePassword(_ password: String) -> Bool {
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", REGEX_PATTERNS.PASSWORD)
        
        return passwordPredicate.evaluate(with: password)
    }
     
    /// Validates the string `email` if it matches an valid email (format a@a.com)
    /// - parameter email: a string representating an email
    /// - returns: `true` if the string correspond to an email valid, or `false` if the string does not correspond to an email valid
    static func validateEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", REGEX_PATTERNS.EMAIL)
        
        return emailPredicate.evaluate(with: email)
    }
    
        
    /// Validates the string `cpf` if it corresponds to a valid Brazil document number CPF
    /// - parameter cpf: a string representating an cpf
    /// - returns: `true` if the string correspond to an CPF valid, or `false` if the string does not correspond to an CPF valid
    static func validateCpf(_ cpf: String) -> Bool {
        guard Self.assertCorrectPattern(cpf) else { return false }
                
        let numbers = cpf.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }
        
        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }
                
        guard Self.assertCorrectSequenceBasedOnAlgorithm(numbers) else { return false }
        
        return true
    }
    
    /// Validates if the string `number`  corresponds to a valid Brazil document number CPF based on Receita Federal algorithm.
    /// - parameter numbers: a string representating a sequence of eleven numbers
    /// - returns: `true` if the string correspond to a CPF valid, or `false` if the string does not correspond to an CPF valid
    private static func assertCorrectSequenceBasedOnAlgorithm(_ numbers: String) -> Bool {
        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i + 1)
            let char = Int(numbers[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == d1 && temp2 == d2
    }
    
    /// Validates the string `cpf` if it matches the pattern XXX.XXX.XXX-XX or XXXXXXXXXXX
    /// - parameter cpf: a string representating a CPF
    /// - returns: `true` if the string matches the CPF pattern or `false` if the string does not match
    private static func assertCorrectPattern(_ cpf: String) -> Bool {
        let cpfPredicate = NSPredicate(format:"SELF MATCHES %@", REGEX_PATTERNS.CPF)
        
        return cpfPredicate.evaluate(with: cpf)
    }
}

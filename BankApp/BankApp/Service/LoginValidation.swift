//
//  LoginValidation.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import Foundation

struct LoginValidation {
    private init() {}
    
    static func validatePassword(_ password: String) -> Bool {
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", REGEX_PATTERNS.PASSWORD)
        
        return passwordPredicate.evaluate(with: password)
    }
     
    static func validateEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", REGEX_PATTERNS.EMAIL)
        
        return emailPredicate.evaluate(with: email)
    }
    
    
    static func validateCpf(_ cpf: String) -> Bool {
        guard Self.assertCorrectPattern(cpf) else { return false }
                
        let numbers = cpf.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }
        
        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }
                
        guard Self.assertCorrectSequenceBasedOnAlgorithm(numbers) else { return false }
        
        return true
    }
    
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
    
    private static func assertCorrectPattern(_ cpf: String) -> Bool {
        let cpfPredicate = NSPredicate(format:"SELF MATCHES %@", REGEX_PATTERNS.CPF)
        
        return cpfPredicate.evaluate(with: cpf)
    }
}

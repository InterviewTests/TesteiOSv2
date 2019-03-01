//
//  Common.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 27/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation

struct Common{
    struct validations{
        static func isValidEmail(email: String) -> Bool{
            let emailRegEx = "[a-zA-Z0-9][a-zA-Z0-9._-]{1,64}+@[a-zA-Z0-9-]{1,63}+\\.[a-zA-Z]{2,63}(?:\\.[a-zA-Z]{2,63})?"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
        
        static func isValidCPF(cpf: String) -> Bool{
            let autocompletedCPF = cpf.autocomplete(toSize: 11, withChar: "0", atBeginning: true)
            let cpfRegEx = "([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})"
            let cpfTest = NSPredicate(format:"SELF MATCHES %@", cpfRegEx)
            return cpfTest.evaluate(with: autocompletedCPF) && validateCPFNumbers(cpf: autocompletedCPF)
        }
        
        static func isValidPassword(password: String) -> Bool{
            let filteredDecimals = password.unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
            let uppercasedLetters = password.unicodeScalars.filter { CharacterSet.uppercaseLetters.contains($0) }
            let symbols = password.unicodeScalars.filter { CharacterSet.symbols.contains($0) || CharacterSet.punctuationCharacters.contains($0) }
            
            return (filteredDecimals.count > 0) && (uppercasedLetters.count > 0) && (symbols.count > 0)
        }
        
        private static func validateCPFNumbers(cpf: String) -> Bool{
            let numbers = cpf.compactMap({Int(String($0))})
            
            guard Set(numbers).count != 1 else { return false }
            
            let sum1 = 11 - ( numbers[0] * 10 +
                numbers[1] * 9 +
                numbers[2] * 8 +
                numbers[3] * 7 +
                numbers[4] * 6 +
                numbers[5] * 5 +
                numbers[6] * 4 +
                numbers[7] * 3 +
                numbers[8] * 2 ) % 11
            let dv1 = sum1 > 9 ? 0 : sum1
            let sum2 = 11 - ( numbers[0] * 11 +
                numbers[1] * 10 +
                numbers[2] * 9 +
                numbers[3] * 8 +
                numbers[4] * 7 +
                numbers[5] * 6 +
                numbers[6] * 5 +
                numbers[7] * 4 +
                numbers[8] * 3 +
                numbers[9] * 2 ) % 11
            let dv2 = sum2 > 9 ? 0 : sum2
            return dv1 == numbers[9] && dv2 == numbers[10]
        }
    }
}

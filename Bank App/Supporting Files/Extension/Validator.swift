//
//  Validator.swift
//  Bank App
//
//  Created by Christian Castro on 29/04/21.
//

import Foundation

class Validator {
    
    static func validateUser(user: String) -> Bool {
        let isValidUser = validateEmail(user: user) || user.isValidCPF
        return isValidUser
    }
    
    static func validateEmail(user: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validationStatus = NSPredicate(format:"SELF MATCHES %@", regEx)
        if (validationStatus.evaluate(with: user) && !user.isEmpty) { return true }
        return false
    }
    
    static func validatePassword(password: String) -> Bool {
        if password.containsNumber &&
            password.containsUppercase &&
            password.containsSpecial &&
            !password.isEmpty {
            return true
        } else {
            return false
        }
    }
}

extension String {
    
    var containsNumber: Bool {
        return rangeOfCharacter(from: .decimalDigits) != nil
    }

    var containsUppercase: Bool {
        return rangeOfCharacter(from: .uppercaseLetters) != nil
    }

    var containsSpecial: Bool {
        let characterSet:NSCharacterSet =
            NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        return rangeOfCharacter(from: characterSet.inverted) != nil
    }
    
    var isValidCPF: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }

        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }

        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
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
}

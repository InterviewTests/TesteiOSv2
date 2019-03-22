//
//  Rules.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit
class Rules{
    
    func verifyPassword(Password: String)-> Bool{
        if capitalLetter(Password: Password) && specialCharacter(Password: Password) && checkAlphaNumeric(Password: Password){
            return true
        }
        return false
    }
    
    func capitalLetter(Password: String)-> Bool{
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let text = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let result = text.evaluate(with: Password)
        return result
    }
    func specialCharacter(Password: String)-> Bool{
        let character = ["!", "@", "#", "$", "%", "&", "*"]
        let srtCharacterArray = Password.map{ String($0)}
        for str in character{
            for strI  in srtCharacterArray{
                if str == strI{
                    return true
                }
            }
            
        }
        return false
    }
    func checkAlphaNumeric(Password: String)->Bool{
        let number = ["1","2","3","4","5","6","7","8","9","0"]
        let srtCharacterArray = Password.map{ String($0)}
        for str in number{
            for strI  in srtCharacterArray{
                if str == strI{
                    return true
                }
            }
            
        }
        return false
    }
    
    
    func isValidUser(user: String)->Bool{
        if isValidEmail(email: user) || user.isValidCPF{
            return true
        }
        return false
    }
    
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailValidate.evaluate(with: email)
    }
    var numberCPF = 0
    func checkIfCPF(user:String)->Bool{
        let number = ["1","2","3","4","5","6","7","8","9","0"]
        let srtCharacterArray = user.map{ String($0)}
        for str in number{
            for strI  in srtCharacterArray{
                if str == strI{
                    numberCPF = numberCPF + 1
                    if numberCPF>=4{
                        return true
                    }
                }
            }
            
        }
        return false
        
    }
    
    
}

extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap({ Int(String($0)) })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
                } % 11
            return digit > 9 ? 0 : digit
        }
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
}



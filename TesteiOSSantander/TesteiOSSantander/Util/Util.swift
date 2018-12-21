//
//  Util.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import UIKit

class Util{
    
    static let getFunctions = Util()

    func verifyPassword(Password: String)-> Bool{
        if letraMaiuscula(Password: Password) && caracterEspecial(Password: Password) && alfaNumerico(Password: Password){
            return true
        }
        return false
    }
    
    func letraMaiuscula(Password: String)-> Bool{
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let text = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let result = text.evaluate(with: Password)
        return result
    }
    func caracterEspecial(Password: String)-> Bool{
        let character = ["!","@","#","$","%","&","*"]
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
    func alfaNumerico(Password: String)->Bool{
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
    func maskOfCPF(user:String)->Bool{
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

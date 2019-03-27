//
//  ValidatorHelper.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

class ValidatorHelper {
    
    static func password(_ password: String) -> Bool {
        let pattern = "^(?=.*[\\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*])[\\w!@#$%^&*]{4,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", pattern)
        return passwordTest.evaluate(with: password)
    }
    
    static func isEmail(_ email: String) -> Bool {
        let emailPattern = "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailTest.evaluate(with: email)
    }
    
    static func isCpf(_ cpf: String) -> Bool {
        var resultP = 0
        var resultS = 0
        
        let cpfWithoutMask = removeFormatterFromNumbers(stringFormatted: cpf)
        if cpfWithoutMask.length != 11 || cpfWithoutMask == "00000000000" || cpfWithoutMask == "11111111111" || cpfWithoutMask == "22222222222" || cpfWithoutMask == "33333333333" || cpfWithoutMask == "44444444444" || cpfWithoutMask == "55555555555" || cpfWithoutMask == "66666666666" || cpfWithoutMask == "77777777777" || cpfWithoutMask == "88888888888" || cpfWithoutMask == "99999999999" {
            return false;
        } else {
            let cpfIntArray = stringToIntArray(str: cpfWithoutMask);
            
            for i in stride(from: 10, to: 1, by: -1) {
                resultP += cpfIntArray[(10-i)] * i
            }
            var divP = 11 - (resultP % 11)
            if divP >= 10 {
                divP = 0
            }
            
            if divP != cpfIntArray[9] {
                return false
            } else {
                for i in stride(from: 11, to: 1, by: -1) {
                    resultS += cpfIntArray[(11-i)] * i
                }
                var divS = 11 - (resultS % 11)
                if divS >= 10 {
                    divS = 0
                }
                
                if divS != cpfIntArray[10] {
                    return false
                }
            }
        }
        
        return true
    }
    
    private static func stringToIntArray(str: String) -> Array<Int> {
        let charArray = Array(str.characters)
        var array = Array<Int>()
        
        for char in charArray {
            let string = String(char)
            let c = Int(string)
            array.append(c!)
        }
        
        return array
    }
    
}

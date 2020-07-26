//
//  FieldChecker.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 26/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import Foundation

struct FieldChecker {
    
    var isEmailValidated:Bool
    var isCPFValidated:Bool
    var isPasswordValidated:Bool
    
    init() {
        self.isEmailValidated = false
        self.isCPFValidated = false
        self.isPasswordValidated = false
    }
    
    mutating func validateEmail(_ enteredEmail:String){
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        self.isEmailValidated = emailPredicate.evaluate(with: enteredEmail)
    }
    
    
    mutating func validateCPF(_ enteredCPF: String) {

        let cpf = enteredCPF.filter("0123456789".contains)
        guard cpf.count == 11 else {
            self.isCPFValidated = false
            return
        }

        // Invalidate if all are equal
        var cpfArray: [Int] = []
        for i in cpf.indices {
            cpfArray.append(Int(String(cpf[i])) ?? 0)
        }
        if(Array(Set(cpfArray.filter({ (i: Int) in cpfArray.filter({ $0 == i }).count == 11}))).count > 0){
            self.isCPFValidated = false
            return
        }
        
        let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
        let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
        let d1 = Int(cpf[i1..<i2])
        let d2 = Int(cpf[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: i)
            let end = cpf.index(cpf.startIndex, offsetBy: i+1)
            let char = Int(cpf[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        self.isCPFValidated = temp1 == d1 && temp2 == d2
    }

    
    mutating func validatePasssword(_ enteredPassword: String){

        // Rule: 1 Upper, 1 Special, 1 AlphaNum
        let passwordRegex = "^(?=.*[A-Z])(?=.*[!@#$&()\\-_=+{}|?*])(?=.*[0-9a-z>.<,:;~`’]).{2,}$"
        self.isPasswordValidated = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: enteredPassword)
    }
    
    
    func isAllFieldsValidated() -> Bool {
        if(self.isPasswordValidated
            && (self.isEmailValidated
                || self.isCPFValidated)){
            return true
        } else {
            return false
        }
    }
    

}



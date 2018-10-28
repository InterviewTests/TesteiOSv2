//
//  StringUtils.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation
let cpfRegex = "[0-9]{11}$"
let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

extension String{
    //esse codigo eh antigo meu, por isso ta deprecated algumas coisas.
    static func isValidCPF(cpf: String)-> Bool {
        let filter = NSCharacterSet(charactersIn: "0123456789")
        var str = cpf.components(separatedBy: filter.inverted).joined(separator: "")
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", cpfRegex)
        let valid = emailTest.evaluate(with: str)
        
        if valid {
            if str.characters.count == 11 {
                
                let start = str.index(str.startIndex, offsetBy: 9)
                let end = str.index(str.endIndex, offsetBy: -1)
                let range = start..<end
                
                let st = Int(str.substring(with: range))
                
                let start2 = str.index(str.startIndex, offsetBy: 10)
                let end2 = str.index(str.endIndex, offsetBy: 0)
                let range2 = start2..<end2
                
                let st2 = Int(str.substring(with: range2))
                
                var temp1 = 0, temp2 = 0
                var inc = 0
                var cpfArr = str.characters.map { String($0) }
                cpfArr.removeLast()
                cpfArr.removeLast()
                for i in cpfArr {
                    let char = Int(i)
                    temp1  = temp1 + char!*(10-inc)
                    temp2 = temp2 + char!*(11-inc)
                    inc = inc + 1
                }
                
                var t1 = temp1 % 11
                if(t1 < 2) {
                    t1 = 0
                } else {
                    t1 = 11-t1
                }
                
                temp2 = temp2 + 2*t1
                var t2 = temp2 % 11
                
                if (t2 < 2){
                    t2 = 0
                } else {
                    t2 = 11 - t2
                }
                
                if t1 == st && t2 == st2 {
                    return true
                }
            }
        }
        return false
    }
    
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func isValidPassword(pswd: String) -> Bool {
        let regex = "^(?=.*?[A-Z])(?=.*?[a-z[0-9]])(?=.*?[#?!@$%^&*-.])[[A-Za-z[0-9]]#?!@$%^&*-.]{0,}$"
        let pswdTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return pswdTest.evaluate(with: pswd)
    }
    
    static func formatCurrencyLabel(value: Float) -> String{
        let val = String(format: "R$ %.02f", value)
        return val
    }
}

//
//  Helpers.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

class Helpers {
    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let test = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return test.evaluate(with: email)
    }
    
    static func isValidCPF(cpf: String) -> Bool {
        let checkCPF = cpf.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: ".").replacingOccurrences(of: " ", with: "")
        if checkCPF.count == 11 {
            let d1 = Int(checkCPF[cpf.index(cpf.startIndex, offsetBy: 9)].description)
            let d2 = Int(checkCPF[cpf.index(cpf.startIndex, offsetBy: 10)].description)
            
            var tmp1 = 0
            var tmp2 = 0
            
            var char: Int = 0
            for i in 0 ... 8 {
                char = Int(checkCPF[cpf.index(cpf.startIndex, offsetBy: i)].description)!
                tmp1 += char * (10 - i)
                tmp2 += char * (11 - i)
            }
            tmp1 %= 11
            tmp1 = tmp1 < 2 ? 0 : 11 - tmp1
            
            tmp2 += tmp1 * 2
            tmp2 %= 11
            tmp2 = tmp2 < 2 ? 0 : 11 - tmp2
            
            if tmp1 == d1 && tmp2 == d2 {
                
                return true
                
            }
        }
        return false
    }
    
    static func formmaterCurrency(value: Double?) -> String {
        var description = "-"
        let formatter = NumberFormatter()
        formatter.locale =  Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "\(formatter.currencySymbol!) "
        if let value = value, let formattedAmount = formatter.string(from: value as NSNumber) {
             description = formattedAmount
        }
        return description
    }
}

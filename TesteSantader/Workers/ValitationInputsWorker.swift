//
//  ValitationWorker.swift
//  TesteSantader
//
//  Created by Bruno Chen on 07/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol valitationInputsWorkerProtocol {
    func isValidImputs(userStr: String?, passwordStr: String?) -> Bool
}

class ValitationInputsWorker: valitationInputsWorkerProtocol {
    
    func isValidImputs(userStr: String?, passwordStr: String?) -> Bool {
        var result = false
        
        if let testStr = userStr, isValidEmail(testStr: testStr) || isValidCpf(testStr: testStr)  {
            if let passwordStr = passwordStr, isValidPassword(passwordStr: passwordStr) {
                result = true
            }
        }
        return result
    }
    
    func isValidPassword(passwordStr: String) -> Bool {
        let passwordRegEx = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: passwordStr)
        return result
    }
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
            return result
    }
    
    func isValidCpf(testStr: String) -> Bool {
        let CPFRegEx = "([0-9]{2}[.]?[0-9]{3}[.]?[0-9]{3}[/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})"
        let CPFTest = NSPredicate(format: "SELF MATCHES %@", CPFRegEx)
        let result = CPFTest.evaluate(with: testStr)
        return result
    }
    
}

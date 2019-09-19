//
//  Extension.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

extension String {
    //Função para verificar se é numero
    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    func validaSenha() -> Bool {
        var valid = true
        let capitalLetter  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetter)
        if !texttest.evaluate(with: self) {
            valid = false
        }
        
        let number  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", number)
        if !texttest1.evaluate(with: self) {
            valid = false
        }
        
        let specialCharacter  = ".*[!&^%$#@()/_*+-]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacter)
        if !texttest2.evaluate(with: self) {
            valid = false
        }
        
        return valid
    }
}

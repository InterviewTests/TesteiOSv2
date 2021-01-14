//
//  InputValidator.swift
//  SwiftUtils
//
//  Created by Bruno Maciel on 8/15/20.
//  Copyright © 2020 brunomaciel. All rights reserved.
//

import Foundation

class InputValidator {
    private init() {}
    
    enum ValidationError: Error {
        case blankEmail
        case invalidEmail
        case blankPassword
        case invalidPassword(message: String)
        case invalidConfirmPassword
        case samePassword
    }
    
    // Valida e-mail exigindo texto antes e depois de uma @ e um .
    static func validateEmail(_ email: String) throws {
        guard !email.isEmpty else { throw ValidationError.blankEmail }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        if !emailPredicate.evaluate(with: email) { throw ValidationError.invalidEmail }
    }
    
    // Validação de senha seguindo regras minímas de segurança
    static func validatePassword(_ password: String) throws {
        if password.isEmpty { throw ValidationError.blankPassword }
        
        let passwordRequirementsMessage = """
        Senha deve conter:
        Ao menos 8 caracteres,
        um número, uma letra maiúscula e um caracter especial -@#$%^&*.
        """
        
//        var passwordRegex: String = ""
//        let mustIncludeUppercased = true
//        if mustIncludeUppercased { passwordRegex.append("(?=.*[A-Z])") }
//        let mustIncludeLowercased = true
//        if mustIncludeLowercased { passwordRegex.append("(?=.*[a-z])") }
//        let mustIncludeDigits = true
//        if mustIncludeDigits { passwordRegex.append("(?=.*[0-9])") }
//        let mustIncludeSpecialCharacters = true
//        if mustIncludeSpecialCharacters { passwordRegex.append("(?=.*[@#$%^&*])") }
//        let minNumOfCharacter = 8
//        let maxNumOfCharacter = 15
//        passwordRegex.append(".{\(minNumOfCharacter),\(maxNumOfCharacter)}")
        
        let passwordRegex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[-@#$%^&*]).{8,}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        if !passwordPredicate.evaluate(with: password) { throw ValidationError.invalidPassword(message: passwordRequirementsMessage) }
    }
    
    static func validateNewPassword(currentPassword: String?=nil, newPassword: String, confirmNewPassword: String) throws {
        /* ***** Validação de nova senha ***** */
        
        /* Verifica se nova senha :
         *  - não está vazia
         *  - está conforme as regras mínimas de segurança
         *  - é igual a confirmação de senha
         */
        
        if let currentPassword = currentPassword {
            if currentPassword == newPassword { throw ValidationError.samePassword }
        }
        
        do {
            try validatePassword(newPassword)
        } catch {
            throw error
        }
        
        if newPassword != confirmNewPassword { throw ValidationError.invalidConfirmPassword }
    }
    
//    static func validateDate(_ date: String, format: String) -> Bool {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//
//        let validDate = dateFormatter.date(from: date)
//        return validDate != nil
//    }
    
    // Valida CPF
    static func validateCPF(_ str: String) -> String? {
        
        let cpf = InputValidator.onlyNumbers(from: str)
        guard cpf.count == 11 else { return nil }
        
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
        
        if temp1 == d1 && temp2 == d2 { return cpf }
        else { return nil }
    }
    
    private static func onlyNumbers(from str: String) -> String {
        guard !str.isEmpty else { return "" }
        return str.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: str.startIndex..<str.endIndex)
    }
}

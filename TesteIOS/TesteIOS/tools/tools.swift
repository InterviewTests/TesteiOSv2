//
//  tools.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation
import UIKit

class Validator {
    private static var pesoCPF: [Int] = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
    private static let EMAIL_REGEX: String = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$"
    private static let PASSWORD_REGEX: String = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$"

    private static func CalcularDigito(str: String, peso: [Int]) -> Int {
        var soma: Int = 0
        for (indice, char) in str.enumerated().reversed() {
            let digito = Int(String(char))
            soma += digito! * peso[peso.count - str.count + indice]
        }
        soma = 11 - soma % 11
        return soma > 9 ? 0 : soma
    }

    public static func isValidEmail(email: String) -> Bool {
        return email ~= EMAIL_REGEX
    }

    public static func isValidPassword(password: String) -> Bool {
        return password ~= PASSWORD_REGEX
    }

    public static func isValidCPF(cpf: String) -> Bool {
        guard cpf.count == 11 else {
            return false
        }
        let str = cpf[..<cpf.index(cpf.startIndex, offsetBy: 9)]
        let digito1 = CalcularDigito(str: String(str), peso: pesoCPF)
        let digito2 = CalcularDigito(str: String(str) + String(digito1), peso: pesoCPF)
        return cpf == (str + String(digito1) + String(digito2))
    }
}

extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        let newRed = CGFloat(Double(red) / 255.0)
        let newGreen = CGFloat(Double(green) / 255.0)
        let newBlue = CGFloat(Double(blue) / 255.0)
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(alpha))
    }
}

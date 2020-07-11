//
//  ValidateCPF.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 29/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

public struct ValidateCPF {
//    public static func validate(cpf: String) -> Bool {
//        var firstSum: Int = 0, secondSum: Int = 0,
//        firstDigit: Int = 0, secondDigit: Int = 0,
//        firstDigitCheck: Int = 0, secondDigitCheck: Int = 0
//
//        if cpf.count != 11 ||
//            cpf == "00000000000" ||
//            cpf == "11111111111" ||
//            cpf == "22222222222" ||
//            cpf == "33333333333" ||
//            cpf == "44444444444" ||
//            cpf == "55555555555" ||
//            cpf == "66666666666" ||
//            cpf == "77777777777" ||
//            cpf == "88888888888" ||
//            cpf == "99999999999" {
//            return false
//        }
//
//        for i in 0...8 {
//            firstSum += Int(cpf[i])! * (10 - i)
//        }
//
//        firstDigit = (firstSum % 11 < 2) ? 0 : 11 - (firstSum % 11)
//
//        for i in 0...9 {
//            secondSum += Int(cpf[i])! * (11 - i)
//        }
//
//        secondDigit = (secondSum % 11 < 2) ? 0 : 11 - (secondSum % 11)
//
//        firstDigitCheck = Int(cpf[9])!
//        secondDigitCheck = Int(cpf[10])!
//
//        guard firstDigit == firstDigitCheck && secondDigit == secondDigitCheck else {
//            return false
//        }
//
//        return true
//    }
}

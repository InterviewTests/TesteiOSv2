//
//  Strings+Extension.swift
//  TesteiOSv2
//
//  Created by Silva, Alex Nunes da on 15/01/2019.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation


extension String {

    func isValidCPF() -> Bool {
        let numbers = characters.flatMap({Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        let soma1 = 11 - ( numbers[0] * 10 +
            numbers[1] * 9 +
            numbers[2] * 8 +
            numbers[3] * 7 +
            numbers[4] * 6 +
            numbers[5] * 5 +
            numbers[6] * 4 +
            numbers[7] * 3 +
            numbers[8] * 2 ) % 11
        let dv1 = soma1 > 9 ? 0 : soma1
        let soma2 = 11 - ( numbers[0] * 11 +
            numbers[1] * 10 +
            numbers[2] * 9 +
            numbers[3] * 8 +
            numbers[4] * 7 +
            numbers[5] * 6 +
            numbers[6] * 5 +
            numbers[7] * 4 +
            numbers[8] * 3 +
            numbers[9] * 2 ) % 11
        let dv2 = soma2 > 9 ? 0 : soma2
        return dv1 == numbers[9] && dv2 == numbers[10]
    }

    func isValidPassword() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", LoginKeys.passWordRegx)
        return passwordTest.evaluate(with: self)
    }

//    func isValidEmail() -> Bool {
//        let emailRegEx = LoginKeys.emailRegx
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: self)
//    }

    func isValidRegex(regEx : String)->Bool{
        let regPredicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return regPredicate.evaluate(with: self)
    }

    mutating func applyCpfMask(){
        let firstSeparator:Character = "."
        let secondSeparator:Character = "-"

        self.insert(firstSeparator, at: self.index(self.startIndex, offsetBy: 3))
        self.insert(firstSeparator, at: self.index(self.startIndex, offsetBy: 7))
        self.insert(secondSeparator, at: self.index(self.startIndex, offsetBy: 11))
    }

}

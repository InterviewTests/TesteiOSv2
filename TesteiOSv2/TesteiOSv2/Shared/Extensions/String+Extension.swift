//
//  String+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 13/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

extension String{
    
    func convertStringToDate(format:String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        guard let date:Date = dateFormatter.date(from: self) else{
            return nil
        }
        
        return date
    }
    
    func textConstainsJustNumbers() -> Bool{
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    func isValidEmail() -> Bool{
        
        if self.count == 0{
            return false
        }
        let emailTest = NSPredicate(format:"SELF MATCHES %@", Regex.email.description)
        return emailTest.evaluate(with: self)
        
    }
    
    func isValidPassword() -> Bool {
        if self.count == 0{
            return false
        }
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", Regex.password.description)
        return passwordTest.evaluate(with: self)
    }
    
    func isValidCPF() -> Bool {
        let numbers = self.compactMap({Int(String($0))})
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
    
}

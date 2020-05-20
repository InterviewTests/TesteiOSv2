//
//  String+Utils.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

extension String {    
    func isValidEmail() -> Bool {
        let emailRegex = "^[a-zA-Z0-9]+[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]{0,64}@[a-zA-Z0-9]+(?:[\\-\\.][a-zA-Z0-9]+)+$"
        return regexString(regexString: emailRegex)
    }
    
    func isValidPassword() -> Bool {
        let regexPassword = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^\\w\\s]).{3,}$"
        return regexString(regexString: regexPassword)
    }
    
    func regexString(regexString: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regexString, options: []) else { return false }
        let range = NSRange(location: 0, length: self.count)
        return regex.matches(in: self, options: [], range: range).count == 0
    }
    
    func formattedNumber(mask: String) -> String {
        let cleanPhoneNumber = self.removeCaracterSpecial
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    var removeCaracterSpecial: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    func isValidCPF() -> Bool {
        let numbers = compactMap({Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        let soma1 = 11 - (
            numbers[0] * 10 + numbers[1] * 9 + numbers[2] * 8 + numbers[3] * 7 +
                numbers[4] * 6 + numbers[5] * 5 + numbers[6] * 4 + numbers[7] * 3 +
                numbers[8] * 2 ) % 11
        let dv1 = soma1 > 9 ? 0 : soma1
        let soma2 = 11 - (
            numbers[0] * 11 + numbers[1] * 10 + numbers[2] * 9 + numbers[3] * 8 +
                numbers[4] * 7 + numbers[5] * 6 + numbers[6] * 5 + numbers[7] * 4 + numbers[8] * 3 +
                numbers[9] * 2 ) % 11
        let dv2 = soma2 > 9 ? 0 : soma2
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    func convertDate(format: String, fromFormat: String) -> String {
        let dateFormatted = self.toDateFormat(format: format, fromFormat: fromFormat)
        return dateFormatted
    }
    
    func toDateFormat(format: String, fromFormat: String) -> String {
           let df: DateFormatter = DateFormatter()
           df.locale = Locale(identifier: "pt_BR")
           df.dateFormat = fromFormat
           guard let date = df.date(from: self) else { return "" }
           df.dateFormat = format
           return df.string(from: date)
       }
}

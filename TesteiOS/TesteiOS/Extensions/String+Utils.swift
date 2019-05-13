//
//  String+Utils.swift
//  TesteiOS
//
//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

extension String {
    func validateRegex(pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            return (regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil)
        } catch {
            return false
        }
    }
    
    func validateCpf() -> Bool {
        let numbers = compactMap({ Int(String($0)) })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        
        let firstDigit = cpfDigitCalculator(slice: numbers.prefix(9))
        let secondDigit = cpfDigitCalculator(slice: numbers.prefix(10))
        
        return firstDigit == numbers[9] && secondDigit == numbers[10]
    }
    
    private func cpfDigitCalculator(slice: ArraySlice<Int>) -> Int {
        var value = slice.count + 2
        
        let digit = 11 - slice.reduce(into: 0, { (result, number) in
            value -= 1
            result += number * value
        }) % 11
        
        return digit > 9 ? 0 : digit
    }
    
    func convertDataFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date?.toString()
    }
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self) ?? Date()
    }
}

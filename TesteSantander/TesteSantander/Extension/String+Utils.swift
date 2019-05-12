//
//  String+Utils.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

extension String {
    func isValidRegex(regex: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    func isValidCpf() -> Bool {
        let numbers = compactMap({ Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }

        let dv1 = digitCalculator(slice: numbers.prefix(9))
        let dv2 = digitCalculator(slice: numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    private func digitCalculator(slice: ArraySlice<Int>) -> Int {
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

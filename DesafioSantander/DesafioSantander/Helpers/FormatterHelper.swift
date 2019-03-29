//
//  FormatterHelper.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation


class FormatterHelper {
    
    static func bankAccountFormatter(agency: String, accountNumber: String) -> String {
        var formatted = removeFormatterFromNumbers(stringFormatted: accountNumber)
        
        if formatted.length == 9 {
            formatted = formatted.replacingOccurrences(of: "(\\d{2})(\\d{6})(\\d{1})", with: "$1.$2-$3", options: String.CompareOptions.regularExpression, range: nil)
        }
            
        return "\(agency) / \(formatted)"
    }
    
    
    static func formatCurrency(value: NSNumber) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        numberFormatter.currencyDecimalSeparator = ","
        numberFormatter.currencyGroupingSeparator = "."
        numberFormatter.currencySymbol = "R$ "
        
        let formatted = numberFormatter.string(from: value)!
        return formatted
    }
    
    static func dateFormat(string: String, inputPattern: String? = "yyyy-MM-dd", outputPattern: String? = "dd/MM/yyyy") -> String {
        guard string.length > 0 else { return "" }
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = inputPattern
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = formatter.date(from: string)
        
        formatter.dateFormat = outputPattern
        
        return formatter.string(from: date!)
    }
}

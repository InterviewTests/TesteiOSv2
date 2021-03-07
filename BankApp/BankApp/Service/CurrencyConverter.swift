//
//  CurrencyConverter.swift
//  BankApp
//  Helper class for use in Currency conversions
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct CurrencyConverter {
    private init() {}
            
    /// Converts a US-pattern currency double in a Brazil-pattern currency string
    /// - parameter value: the double value representing a currency value (e.g. 27.98)
    /// - returns: a string representing the value in Brazil currency pattern with sign (e.g. "R$ 27,90)
    static func convertUSNumberValueToBRStringValue(_ value: Double) -> String {
        let number = NumberFormatter()
        number.numberStyle = .currency
        number.usesGroupingSeparator = true
        number.locale = Locale(identifier: "pt_BR")
        
        let numberNS = NSNumber(value: value)
        
        return number.string(from: numberNS)!
    }
}

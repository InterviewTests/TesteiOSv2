//
//  CurrencyConverter.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct CurrencyConverter {
    private init() {}
    
    static func convertUSNumberValueToBRStringValue(_ value: Double) -> String {
        let number = NumberFormatter()
        number.numberStyle = .currency
        number.usesGroupingSeparator = true
        number.locale = Locale(identifier: "pt_BR")
        
        let numberNS = NSNumber(value: value)
        
        return number.string(from: numberNS)!
    }
}

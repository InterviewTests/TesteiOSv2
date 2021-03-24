//
//  classValue.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

class Value
{
    
      static func parseCurrency(_ value: Double) -> String
      {
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
            currencyFormatter.locale = Locale(identifier: "pt_BR")
            
            let valueString = currencyFormatter.string(from: NSNumber(value: value))!
            
            return valueString
      }
    
}

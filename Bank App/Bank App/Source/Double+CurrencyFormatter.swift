//
//  Double+CurrencyFormatter.swift
//  Bank App
//
//  Created by Chrystian on 17/01/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    func toString() -> String {
        return String(self)
    }
    
    func toStringCurrency() -> String {
        let currencyFormat: String = NSLocalizedString("CURRENCY_FORMAT", comment: "currency")
        var stringFormated: String = currencyFormat
        let stringValue = String(format: "%.2f", self)
        
        for letter in stringValue {
            if letter == "." {
                stringFormated.append(",")
            }
            else if letter != "-" {
                stringFormated.append(letter)
            }
        }
        
        if stringValue.contains("-") {
            return "-\(stringFormated)"
        }
        else {
            return "\(stringFormated)"
        }
    }
}

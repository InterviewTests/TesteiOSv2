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
    
    func toStringValue() -> String {
        let currencyFormat: String = "R$"
        var stringFormated: String = currencyFormat
        let stringValue = String(format: "%.2f", self)
        
        if stringValue.contains("-") {
            for letter in stringValue {
                if letter != "-" {
                    stringFormated.append(letter)
                }
            }
            return "-\(stringFormated)"
        }
        else {
            return "\(currencyFormat)\(stringValue)"
        }
    }
}

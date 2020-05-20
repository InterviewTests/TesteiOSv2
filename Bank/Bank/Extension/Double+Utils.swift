//
//  Double+Utils.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 19/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

extension Double {
    
    func currencyFormat() -> String {
        let amount = self
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.groupingSeparator = ","
        numberFormatter.decimalSeparator = "."
        numberFormatter.locale = Locale(identifier: "pt_BR")
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
}

//
//  Double+Extensions.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

extension Double {
    
    func formatCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: NSNumber(value: self)) {
            return formattedTipAmount
        } else { return "\(self)" }
    }
}

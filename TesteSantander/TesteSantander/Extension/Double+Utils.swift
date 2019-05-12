//
//  Double+Utils.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

extension Double {
    func currencyFormatted() -> String? {
        var number: NSNumber!
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        
        number = NSNumber(value: self)
        
        return formatter.string(from: number)
    }
}

//
//  Double+Utils.swift
//  TesteiOS
//
//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

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

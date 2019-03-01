//
//  Double+Extensions.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation

extension Double{
    func currencyFormatted() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        
        number = NSNumber(value: self)
        
        if let formattedString = formatter.string(from: number){
            return formattedString
        }
        
        return ""
    }

}

//
//  String+NumberFormatter.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 27/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

extension String {
    
    static func FormatReal(_ float: Float) -> String{
        // R$ #.###,##
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
    
        return currencyFormatter.string(from: NSNumber(value: float))!
    }
    
    
    static func FormatAccountNumber(_ string: String) -> String{
        // ##.######-#
        if(string.count >= 9){
            let firstIndex = string.index(string.startIndex, offsetBy: 0)..<string.index(string.startIndex, offsetBy: 2)
            let secondIndex = string.index(string.startIndex, offsetBy: 2)..<string.index(string.startIndex, offsetBy: 8)
            let thirdIndex = string.index(string.startIndex, offsetBy: 8)..<string.endIndex
            return "\(string[firstIndex]).\(string[secondIndex])-\(string[thirdIndex])"
        } else {
            return ""
        }
    }
    
    func toDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.date(from: self)!
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

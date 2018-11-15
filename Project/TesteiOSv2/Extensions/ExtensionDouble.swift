//
//  ExtensionDouble.swift
//  TesteiOSv2
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//

import Foundation

extension Double {
    
    var toCurrency : String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.init(identifier: "pt_BR")
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}











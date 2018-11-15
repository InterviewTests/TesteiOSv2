//
//  UtilDate.swift
//  Passageiro
//
//  Created by Voll on 15/02/2018.
//  Copyright © 2018 Jigs. All rights reserved.
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











//
//  Double+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 12/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

extension Double{

    func convertCoin(localeIdentifier: String = "pt_BR") -> String{
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: localeIdentifier)
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: self as NSNumber){
            return formattedTipAmount
        }
        
        return ""
    }
    
}

//
//  Date+Format.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 07/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

extension Date {
    
    func stringDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = StringIdentifier.commonsDateFormat.getString()
        
        return formatter.string(from: self)
    }
    
}


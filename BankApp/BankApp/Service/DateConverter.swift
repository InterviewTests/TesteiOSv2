//
//  DateConverter.swift
//  BankApp
//  Helper struct used for Date conversion.
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct DateConverter {
    private init() {}
    
    
    /// Converts a US-pattern date string **yyyy-MM-DD** to BR-pattern date string **dd/MM/yyyy**
    /// - parameter dateString: the date in US pattern
    /// - returns: the date in BR pattern
    static func convertUSDateStringToBRDateString(_ dateString: String) -> String {
        let year = dateString.prefix(4)
        let month = dateString.prefix(7).suffix(2)
        let day = dateString.suffix(2)
        
        let dateConvertedString = "\(day)/\(month)/\(year)"
        
        return dateConvertedString
    }
}

//
//  DateConverter.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct DateConverter {
    private init() {}
    
    static func convertUSDateStringToBRDateString(_ dateString: String) -> String {
        let year = dateString.prefix(4)
        let month = dateString.prefix(7).suffix(2)
        let day = dateString.suffix(2)
        
        let dateConvertedString = "\(day)/\(month)/\(year)"
        
        return dateConvertedString
    }
}

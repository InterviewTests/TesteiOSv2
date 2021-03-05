//
//  DateConverter.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct DateConverter {
    private init() {}
    
    static func convertUSDateStringToBRDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: dateString)!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.date(from: dateFormatter.string(from: date))
    }
}

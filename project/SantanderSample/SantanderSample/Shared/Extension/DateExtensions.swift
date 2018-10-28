//
//  String.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 28/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

extension Formatter {
    
    static var utc: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
    
}

extension String {
    
    func toDate(format: DateFormatterString) -> Date {
        let dateFormatter = Formatter.utc
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)!
    }
}

extension Date {
    func toString(format: DateFormatterString) -> String {
        let dateFormatter = Formatter.utc
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}

public enum DateFormatterString: String {
    case apiDate = "yyyy-MM-dd"
    case displayDate = "dd/MM/yyyy"
}

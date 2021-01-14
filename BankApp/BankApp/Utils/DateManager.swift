//
//  Mask.swift
//  SwiftUtils
//
//  Created by Bruno Maciel on 10/12/20.
//  Copyright © 2020 brunomaciel. All rights reserved.
//

import UIKit

//* ===== Class ===== */
class DateManager {
    private init() {}
    
    enum ComparisonMode {
        case equal, before, after, equalOrBefore, equalOrAfter
    }
    
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: TimeZone.current.secondsFromGMT()) as TimeZone
        return formatter
    }()
    
    
    enum DateFormat: String {
        case pt_br = "dd/MM/yyyy"
        case us_en = "MM/dd/yyyy"
        case iso_short = "yyyy-MM-dd"
    }
    
    
    // MARK: Date -> String
    static func formatDate(_ date: Date, as format: DateFormat) -> String {
        return formatDate(date, as: format.rawValue)
    }
    
    static func formatDate(_ date: Date, as format: String) -> String {
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    
    // MARK: String -> Date
    static func dateFromString(_ string: String, format: DateFormat, utc: Bool=false) -> Date? {
        if utc {
            let formatter = DateFormatter()
            formatter.dateFormat = format.rawValue
            formatter.timeZone = TimeZone(identifier: "UTC")
            
            guard let date = formatter.date(from: string) else { return nil }
            return date
            
        } else {
            return dateFromString(string, format: format.rawValue)
        }
    }
    
    static func dateFromString(_ string: String, format: String) -> Date? {
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: string) else { return nil }
        return date
    }
    
    
    // MARK: String -> Date -> String
    static func convertDate(_ dateString: String, fromFormat originFormat: DateFormat, toFormat destinyFormat: DateFormat) -> String? {
        guard let date = dateFromString(dateString, format: originFormat.rawValue) else { return nil }
        
        return formatDate(date, as: destinyFormat.rawValue)
    }
    
    static func convertDate(_ dateString: String, fromFormat originFormat: String, toFormat destinyFormat: String) -> String? {
        guard let date = dateFromString(dateString, format: originFormat) else { return nil }
        
        return formatDate(date, as: destinyFormat)
    }
    
}

//
//  String+Extensions.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 27/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation

extension String{
    
    func isEmtpy() -> Bool{
        return self == ""
    }
    
    func autocomplete(toSize: Int, withChar: Character, atBeginning: Bool) -> String{
        var autocompletedString = self
        
        if self.count >= toSize{
            return self
        }
        
        for _ in self.count...toSize{
            if atBeginning{
                autocompletedString = String(withChar) + autocompletedString
            } else {
                autocompletedString = autocompletedString + String(withChar)
            }
        }
        
        return autocompletedString
    }
    
    func convertDateFormat() -> String?{
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy/MM/dd"
        let date = fmt.date(from: self)
        fmt.dateFormat = "dd/MM/YYYY"
        
        if let currentLocale = NSLocale.preferredLanguages.first{
            fmt.locale = Locale(identifier: currentLocale)
        }

        if let thisDate = date{
            let formattedDate = fmt.string(from: thisDate)
            return formattedDate
        }
        
        return nil
    }
    
    func getDate() -> Date?{
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy/MM/dd"
        return fmt.date(from: self)
    }
    
}

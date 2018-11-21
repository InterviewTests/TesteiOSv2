//
//  Date.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 21/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    var ISOString: String {
        let dtFmt = DateFormatter()
        let locale = Locale.current
        
        dtFmt.dateFormat = "yyyy-MM-dd"
        dtFmt.locale = locale
        
        return dtFmt.string(from: self)
    }
    func string(withFormat format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    init?(string: String?, dateFormat: String = "yyyy/mm/dd") {
        guard let string = string else {
            return nil
        }
        
        let dtFmt = DateFormatter()
        let locale = Locale.current
        
        dtFmt.dateFormat = dateFormat
        dtFmt.locale = locale
        
        if let date = dtFmt.date(from: string) {
            self.init(timeInterval: 0, since: date)
        } else {
            return nil
        }
    }
}

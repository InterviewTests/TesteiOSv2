//
//  Date+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 13/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

extension Date{
    
    func convertDateToString(format:String) -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        dateFormat.isLenient = true
        
        let dateString = dateFormat.string(from: self)
        
        return dateString
        
    }
    
}

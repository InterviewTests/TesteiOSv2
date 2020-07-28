//
//  NSDate+Formatter.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 27/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

extension Date {
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    
}

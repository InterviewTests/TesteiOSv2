//
//  Date+Extension.swift
//  Bank
//
//  Created by Thiago Lima on 20/01/19.
//  Copyright © 2019 SantanderTecnologia. All rights reserved.
//

import Foundation

extension Date {
    
    func string() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

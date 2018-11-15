//
//  UtilDate.swift
//  Passageiro
//
//  Created by Voll on 15/02/2018.
//  Copyright © 2018 Jigs. All rights reserved.
//

import Foundation

extension Date {
    
    var stringDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
}

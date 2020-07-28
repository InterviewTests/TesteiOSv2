//
//  BankTransaction.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 26/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import Foundation

struct BankTransaction {
    var date: String?
    var description: String?
    var title: String?
    var value: NSNumber?
    
    init(date: String, description: String, title: String, value: NSNumber) {
        self.date = date
        self.description = description
        self.title = title
        self.value = value
    }
    
}

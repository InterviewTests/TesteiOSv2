//
//  StringExtensions.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


extension String {
    
    var isValidPassword: Bool {
        let regex = "(?=.*?\\d)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[^\\w]).{3,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regex)
        return pred.evaluate(with: self)
    }
}

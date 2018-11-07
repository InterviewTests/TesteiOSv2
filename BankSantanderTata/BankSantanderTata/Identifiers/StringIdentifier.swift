//
//  StringIdentifier.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 07/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation


enum StringIdentifier: String, CustomIdentifier {

    case commonsDateFormat

}

extension StringIdentifier {
    
    func getString() -> String {
        return String(withCustomIdentifier: self)
    }
    
    func getLocalized(number: Int) -> String {
        return String(format: getString(), number)
    }
    
}

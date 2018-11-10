//
//  String.swift
//  TesteiOSv2
//
//  Created by Bruno on 10/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

extension String {
    var withoutCPFCharacters: String {
        let withoutPeriod = self.replacingOccurrences(of: ".", with: "")
        return withoutPeriod.replacingOccurrences(of: "-", with: "")
    }
    
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    func isValidCPF() -> Bool {
        let regex = "^[0-9]{11}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let regex = "^.*(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!#$@%&?\"]).*"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}

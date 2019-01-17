//
//  String+PasswordValidation.swift
//  Bank App
//
//  Created by Chrystian on 15/01/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

extension String {
    
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
}

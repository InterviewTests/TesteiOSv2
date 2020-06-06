//
//  ValidatorEmail.swift
//  Validator
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public protocol ValidatorEmailProtocol {
    func validate(with email: String) -> Bool
}

public class ValidatorEmail: ValidatorEmailProtocol {
    public func validate(with email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        
    }
}

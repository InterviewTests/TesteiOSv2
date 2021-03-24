//
//  extensionString.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

extension String
{
      static func validateEmail(candidate: String) -> Bool
      {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: candidate)
      }
      
      static func validatePassword(candidate: String) -> Bool
      {
            let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,12}"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: candidate)
      }
}

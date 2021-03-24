//
//  classRegex.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

class Regex
{
    
      static func isRealEmail(_ emailCandidate: String) -> Bool
      {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: emailCandidate)
      }
    
      static func isAcceptablePassword(_ passwordCandidate: String) -> Bool
      {
            let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{4,12}"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: passwordCandidate)
      }
    
}

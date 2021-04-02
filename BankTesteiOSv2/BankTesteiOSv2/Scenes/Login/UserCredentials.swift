//
//  structUser.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

class UserCredentials
{
      var userEmailOrCPF: String = ""
      var userPassword: String = ""
      
      convenience init( _ emailOrCPF: String, _ password: String)
      {
            self.init()
            
            self.userEmailOrCPF = emailOrCPF
            self.userPassword = password
      }
}

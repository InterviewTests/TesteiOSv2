//
//  structUser.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

struct UserCredentials
{
      var userEmailOrCPF: String
      var userPassword: String
}

extension UserCredentials
{
      init(userCredentials: UserCredentials)
      {
            self.userEmailOrCPF = userCredentials.userEmailOrCPF
            self.userPassword = userCredentials.userPassword
      }
}

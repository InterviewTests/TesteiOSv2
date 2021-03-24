//
//  UserRootUserAccount.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import UIKit

struct UserRoot: Decodable
{
      var userAccount: UserAccount
      var error:  UserAccountError
      
      enum CodingKeys: String, CodingKey
      {
            case userAccount = "userAccount"
            case error = "error"
      }
      
}

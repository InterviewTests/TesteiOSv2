//
//  LoginError.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

enum LoginError: ErrorProtocol {
  case emptyUser, invalidUser, emptyPassword, invalidPassword

  var code: Int {
    switch self {
    case .emptyUser:
      return -100
    case .invalidUser:
      return -101
    case .emptyPassword:
      return -200
    case .invalidPassword:
      return -201
    }
  }

  var localizedDescription: String {
    switch self {
    case .emptyUser:
      return String.Login.Error.emptyUser
    case .invalidUser:
      return String.Login.Error.invalidUser
    case .emptyPassword:
      return String.Login.Error.emptyPassword
    case .invalidPassword:
      return String.Login.Error.invalidPassword
    }
  }
}

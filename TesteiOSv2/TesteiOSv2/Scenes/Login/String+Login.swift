//
//  String+Login.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 15/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension String {
  struct Login {
    static var userPlaceholder: String {
      return "LOGIN_PLACEHOLDER_USER".localized
    }

    static var passwordPlaceholder: String {
      return "LOGIN_PLACEHOLDER_PASSWORD".localized
    }

    static var button: String {
      return "LOGIN_BUTTON".localized
    }

    struct Error {
      static var emptyUser: String {
        return "LOGIN_ERROR_EMPTYUSER".localized
      }

      static var invalidUser: String {
        return "LOGIN_ERROR_INVALIDUSER".localized
      }

      static var emptyPassword: String {
        return "LOGIN_ERROR_EMPTYPASSWORD".localized
      }

      static var invalidPassword: String {
        return "LOGIN_ERROR_INVALIDPASSWORD".localized
      }
    }
  }
}

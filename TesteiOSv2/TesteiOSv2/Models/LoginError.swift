//
//  LoginError.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 11/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import UIKit
import Moya

enum LoginError: Swift.Error {
  
  case invalidUsername
  case invalidPassword
  case networkFailure
  case noInternetConnection
  
  enum Localization: String {
    case invalidUsernameTitle = "loginError.invalidUsername.title"
    case invalidUsernameMessage = "loginError.invalidUsername.message"
    case invalidPasswordTitle = "loginError.invalidPassword.title"
    case invalidPasswordMessage = "loginError.invalidPassword.message"
    case networkFailureTitle = "loginError.networkFailure.title"
    case networkFailureMessage = "loginError.networkFailure.message"
    case noInternetConnectionTitle = "loginError.noInternetConnection.title"
    case noInternetConnectionMessage = "loginError.noInternetConnection.message"
  }
}

extension LoginError {
  var description: (title: String, message: String) {
    switch self {
    case .invalidPassword:
      let title = NSLocalizedString(Localization.invalidPasswordTitle.rawValue, comment: "")
      let message = NSLocalizedString(Localization.invalidPasswordMessage.rawValue, comment: "")
      return (title: title, message: message)
    case .invalidUsername:
      let title = NSLocalizedString(Localization.invalidUsernameTitle.rawValue, comment: "")
      let message = NSLocalizedString(Localization.invalidUsernameMessage.rawValue, comment: "")
      return (title: title, message: message)
    case .networkFailure:
      let title = NSLocalizedString(Localization.networkFailureTitle.rawValue, comment: "")
      let message = NSLocalizedString(Localization.networkFailureMessage.rawValue, comment: "")
      return (title: title, message: message)
    case .noInternetConnection:
      let title = NSLocalizedString(Localization.noInternetConnectionTitle.rawValue, comment: "")
      let message = NSLocalizedString(Localization.noInternetConnectionMessage.rawValue, comment: "")
      return (title: title, message: message)
    }
  }
}

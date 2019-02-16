//
//  PasswordValidation.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct PasswordValidation {
  static func validate(value: String?) -> Bool {
    let pattern = "^(?=.*[A-Z])(?=.*[!@#$%&])(?=.*[0-9])."
    guard let password = value, !password.isEmpty else { return false }
    let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let range = NSRange(0..<password.count)
    let match = regex?.firstMatch(in: password, options: .reportCompletion, range: range)
    return match != nil
  }
}

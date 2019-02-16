//
//  EmailValidation.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct EmailValidation: Validation {
  static func validate(value: String?) -> Bool {
    let pattern = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    guard let email = value, !email.isEmpty else { return false }
    let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let range = NSRange(0..<email.count)
    let match = regex?.firstMatch(in: email, options: .reportCompletion, range: range)
    return match != nil
  }
}

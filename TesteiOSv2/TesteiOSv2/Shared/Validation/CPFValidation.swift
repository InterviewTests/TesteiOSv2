//
//  CPFValidation.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct CPFValidation: Validation {
  static func validate(value: String?) -> Bool {
    let pattern = "[0-9]{11}"
    guard let cpf = value, !cpf.isEmpty else { return false }
    let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let range = NSRange(0..<cpf.count)
    let match = regex?.firstMatch(in: cpf, options: .reportCompletion, range: range)
    return match != nil
  }
}

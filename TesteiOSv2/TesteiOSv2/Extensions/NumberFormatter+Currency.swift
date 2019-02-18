//
//  NumberFormatter+Currency.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension NumberFormatter {
  static let currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "pt-BR")
    formatter.numberStyle = .currencyAccounting
    return formatter
  }()
}

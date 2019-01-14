//
//  DoubleExtension.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import UIKit

extension Double {
  static func toCurrency(value: Double) -> String? {
    let formatter = NumberFormatter()
    formatter.locale = Locale.init(identifier: "pt_BR")
    formatter.numberStyle = .currency
    return formatter.string(from: value as NSNumber)
  }
}

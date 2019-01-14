//
//  DateExtension.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

extension Date {
  static func stringFormatter(from: String = "yyyy-MM-dd", to: String = "dd/MM/yyyy", value: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = from
    let date = dateFormatter.date(from: value)
    dateFormatter.dateFormat = to
    return dateFormatter.string(from: date!)
  }
}

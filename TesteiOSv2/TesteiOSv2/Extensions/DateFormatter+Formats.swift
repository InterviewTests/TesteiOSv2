//
//  DateFormatter+Formats.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension DateFormatter {
  static var apiDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
  }()

  static var displayDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter
  }()
}

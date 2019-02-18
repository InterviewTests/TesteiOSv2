//
//  String+TesteiOSv2.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 15/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension String {
  var localized: String {
    return NSLocalizedString(self, comment: "")
  }
}

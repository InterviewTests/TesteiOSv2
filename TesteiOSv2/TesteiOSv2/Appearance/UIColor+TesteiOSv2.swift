//
//  UIColor+TesteiOSv2.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 16/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
    self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
  }

  static var strongBlue: UIColor {
    return UIColor(red: 59, green: 72, blue: 238)
  }
}

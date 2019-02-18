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

  static var lightText: UIColor {
    return UIColor(red: 168, green: 180, blue: 196)
  }

  static var darkText: UIColor {
    return UIColor(red: 72, green: 84, blue: 101)
  }

  static var tableViewBackgroundColor: UIColor {
    return UIColor(red: 254, green: 254, blue: 254)
  }
}

//
//  UIFont+TesteiOSv2.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 15/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

extension UIFont {
  static var headerFont: UIFont {
    return UIFont.boldSystemFont(ofSize: 20)
  }

  static var h1Font: UIFont {
    return UIFont.systemFont(ofSize: 25, weight: .light)
  }

  static var smallFont: UIFont {
    return UIFont.systemFont(ofSize: 12)
  }

  static var regularFont: UIFont {
    return UIFont.systemFont(ofSize: 16)
  }

  static var largeLightFont: UIFont {
    return UIFont.systemFont(ofSize: 20, weight: .light)
  }
}

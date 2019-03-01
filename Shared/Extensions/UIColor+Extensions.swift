//
//  UIColor+Extensions.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class var santanderLightGray: UIColor {
        return UIColor.init(hex: "DBDFE3").withAlphaComponent(0.30)
    }

    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

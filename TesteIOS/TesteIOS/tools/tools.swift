//
//  tools.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation
import UIKit



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        let newRed = CGFloat(Double(red)/255.0)
        let newGreen = CGFloat(Double(green)/255.0)
        let newBlue = CGFloat(Double(blue)/255.0)
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(alpha))
    }
}

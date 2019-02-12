//
//  UIColor+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    @nonobjc class var TextFieldBorderColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: Colors.TextFieldBorderColor.description) ?? .black
        } else {
            return UIColor(red:220/255, green:226/255, blue: 238/255, alpha:1.0)
        }
    }
    
    @nonobjc class var ButtonBackgroundColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: Colors.ButtonBackgroundColor.description) ?? .black
        } else {
            return UIColor(red:59/255, green:72/255, blue: 238/255, alpha:1.0)
        }
    }
    
    @nonobjc class var ShadowCellColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: Colors.ShadowCellColor.description) ?? .black
        } else {
            return UIColor(red:217/255, green:226/255, blue: 233/255, alpha:0.5)
        }
        
    }
    
    @nonobjc class var BorderCellColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: Colors.ShadowCellColor.description) ?? .black
        } else {
            return UIColor(red:219/255, green:223/255, blue: 227/255, alpha:0.3)
        }
        
    }
    
    
}

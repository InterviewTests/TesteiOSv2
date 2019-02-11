//
//  UIView+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func addBorder(width: CGFloat = 1, radius: CGFloat = 4.0, color: UIColor = .black ){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func addShadow( color: UIColor, opacity: Float, offSetWidth: Double, offSetHeight: Double, radius: CGFloat){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: offSetWidth, height: offSetHeight)
        self.layer.shadowRadius = radius
    }
    
}

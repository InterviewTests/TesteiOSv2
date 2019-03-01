//
//  UIView+Extensions.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func addBorder(color:UIColor = UIColor.black, width: CGFloat = 1.0)  {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func addShadow( color: UIColor = UIColor.gray, opacity: Float = 0.2, offSetWidth: Double = 1.0, offSetHeight: Double = 1.0, radius: CGFloat = 4)
    {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: offSetWidth, height: offSetHeight)
        self.layer.shadowRadius = radius
    }


}

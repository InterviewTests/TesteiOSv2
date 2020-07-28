//
//  UIView+LayoutModifier.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 27/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

extension UIView {
    
    static func LayoutRoundedWithShadow(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 12
    }
    
    
    
    
}

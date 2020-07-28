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
    
    static func LayoutRoundedWithShadow2(view: UIView, color: UIColor, shadow: Bool) -> UIView{
        
        view.layer.cornerRadius = 4.0
        
        if shadow {
            view.layer.shadowColor = color.cgColor
            view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            view.layer.shadowOpacity = 0.3
            view.layer.shadowRadius = 6.0
            view.layer.masksToBounds = false
        }
        
        if view .isKind(of: UITextField.self) {
            let textField = view as! UITextField
            textField.borderStyle = UITextField.BorderStyle.roundedRect
        }
        
        return view
        
    }
    
    
    
}

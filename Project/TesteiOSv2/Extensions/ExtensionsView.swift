//
//  ExtensionView.swift
//  TesteiOSv2
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    
    @IBInspectable var shadowHeight: CGFloat {
        get {
            return self.layer.shadowOffset.height
        }
        set {
            self.layer.shadowOffset.height = newValue
        }
    }
    
    
    @IBInspectable var shadowWidth: CGFloat {
        get {
            return self.layer.shadowOffset.width
        }
        set {
            self.layer.shadowOffset.width = newValue
        }
    }
    
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor:self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor:self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    
    
    @IBInspectable var borderAlpha: CGFloat {
        get {
            return (self.layer.borderColor?.alpha)!
        }
        set {
            self.layer.borderColor? = UIColor(cgColor:self.layer.borderColor!).withAlphaComponent(newValue).cgColor
        }
    }
    
    
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0),
                   shadowOpacity: Float = 0.3,
                   borderColor: UIColor = UIColor.black,
                   shadowRadius: CGFloat = 3.0,
                   borderWidth: CGFloat = 0.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.borderColor = shadowColor
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

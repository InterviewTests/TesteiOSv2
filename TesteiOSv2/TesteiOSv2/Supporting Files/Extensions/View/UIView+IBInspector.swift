//
//  UIView+IBInspector.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 10/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

extension UIView {
  
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return self.layer.cornerRadius
    }
    set {
      self.layer.cornerRadius = newValue
      //layer.masksToBounds = newValue > 0
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
  
  @IBInspectable var borderViewColor: UIColor? {
    get {
      return UIColor(cgColor: self.layer.borderColor!)
    }
    set {
      self.layer.borderColor = newValue?.cgColor
    }
  }
  
  @IBInspectable var shadowColor: UIColor {
    get {
      return UIColor(cgColor: self.layer.shadowColor!)
    }
    set {
      self.layer.shadowColor = newValue.cgColor
    }
  }
  
  @IBInspectable var shadowOpacity: Float {
    get {
      return self.layer.shadowOpacity
    }
    set {
      self.layer.shadowOpacity = newValue
    }
  }
  
  @IBInspectable var shadowOffset: CGSize {
    get {
      return self.layer.shadowOffset
    }
    set {
      self.layer.shadowOffset = newValue
    }
  }
  
  @IBInspectable var shadowRadius: CGFloat {
    get {
      return self.layer.shadowRadius
    }
    set {
      self.layer.shadowRadius = newValue
    }
  }
  
  @IBInspectable var shouldRasterize: Bool {
    get {
      return self.layer.shouldRasterize
    }
    set {
      self.layer.shouldRasterize = newValue
    }
  }
  
  @IBInspectable var roundedByHeight: Bool {
    get {
      return self.layer.cornerRadius == self.frame.height
    }
    set {
      if newValue == true {
        self.layer.cornerRadius = self.frame.height / 8
        self.layer.masksToBounds = true
        
      } else {
        self.layer.cornerRadius = 0
      }
      
    }
  }
  
  @IBInspectable var roundedCircle: Bool {
    get {
      return self.layer.cornerRadius == self.frame.height/2
    }
    set {
      if newValue == true {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        
      } else {
        self.layer.cornerRadius = 0
      }
      
    }
  }
  
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
  
  func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                 shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                 shadowOpacity: Float = 0.9,
                 shadowRadius: CGFloat = 8.0) {
    layer.shadowColor = shadowColor
    layer.shadowOffset = shadowOffset
    layer.shadowOpacity = shadowOpacity
    layer.shadowRadius = shadowRadius
  }
  
  func fadeIn(cell: UITableViewCell?, withDuration duration: TimeInterval = 1.0) {
    
    UIView.animate(withDuration: 0.5, animations: {
      cell?.isHidden = false
    }, completion: { (_) in
      UIView.animate(withDuration: duration, animations: {
        cell?.contentView.alpha = 1.0
      })
    })
  }
  
  func fadeOut(cell: UITableViewCell?, withDuration duration: TimeInterval = 1.0) {
    UIView.animate(withDuration: 0.5, animations: {
      cell?.contentView.alpha = 0.0
    }, completion: { (_) in
      cell?.isHidden = true
    })
    
  }
  
  func roundCorner(value: CGFloat) {
    self.layer.cornerRadius = value
    self.layer.masksToBounds = true
  }
  
  func roundToCircle() {
    self.layer.cornerRadius = self.bounds.width/2
    self.layer.masksToBounds = true
  }
  
  public func findFirstResponder() -> UIView? {
    if self.isFirstResponder {
      return self
    }
    
    for subview in self.subviews {
      let v = subview.findFirstResponder()
      if v != nil {
        return v
      }
    }
    
    return nil
  }
}

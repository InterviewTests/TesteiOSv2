//
//  CustomView.swift
//  TesteiOSV2_Rafael_Hieda
//
//  Created by Rafael  Hieda on 10/29/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import UIKit

@IBDesignable class CustomView : UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    
}

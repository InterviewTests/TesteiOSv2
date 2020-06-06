//
//  UIView.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 05/06/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import UIKit

extension UIView {
    
    func shadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
    }
    
}

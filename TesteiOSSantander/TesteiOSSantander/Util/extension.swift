//
//  extension.swift
//  TesteiOSSantander
//
//  Created by Gersinho on 21/12/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func applyShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 0.5
    }
    func roundBorder(){
        self.layer.cornerRadius = 5.0

    }
    
    
}

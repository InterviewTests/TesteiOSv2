//
//  Extension+UIView.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func applyShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 6.0
    }
  
    
    
}


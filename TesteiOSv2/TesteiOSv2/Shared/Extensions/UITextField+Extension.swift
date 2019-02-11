//
//  UITextField+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    
    func addLeftPadding(leftSpace: CGFloat = 10){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftSpace, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
}

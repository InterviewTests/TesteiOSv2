//
//  UIViewController+StatusBarColor.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 03/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setStatusBarStyle(_ style: UIStatusBarStyle, backgroundColor: UIColor) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = backgroundColor
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
}

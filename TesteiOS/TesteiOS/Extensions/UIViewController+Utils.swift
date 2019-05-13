//
//  UIViewController+Utils.swift
//  TesteiOS
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

extension UIViewController {
    func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

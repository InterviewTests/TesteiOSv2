//
//  UIWindow+SetRoot.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func set(rootViewController newRootViewController: UIViewController) {
        
        let previousViewController = rootViewController
        
        rootViewController = newRootViewController
        newRootViewController.setNeedsStatusBarAppearanceUpdate()
        
        if let transitionViewClass = NSClassFromString("UITransitionView") {
            for subview in subviews where subview.isKind(of: transitionViewClass) {
                subview.removeFromSuperview()
            }
        }
        
        if let previousViewController = previousViewController {
            previousViewController.dismiss(animated: false) {
                previousViewController.view.removeFromSuperview()
            }
        }
    }
}

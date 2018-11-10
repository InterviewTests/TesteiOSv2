//
//  UIView.swift
//  TesteiOSv2
//
//  Created by Bruno on 10/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

/// Tag used to remove lock view when requested
private let backgroundViewTag = 3432

extension UIView {
    /// Blocks user interaction and add an animating view to represent a loading process
    func lock() {
        if let blockedView = self.viewWithTag(backgroundViewTag) {
            blockedView.removeFromSuperview()
        }
        
        let backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.tag = backgroundViewTag
        
        self.addSubview(backgroundView)
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.topAnchor.constraint(lessThanOrEqualTo: topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor).isActive = true
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.25)
        }, completion: nil)
    }
    
    /// Removes animating view that represents a loading process
    func unlock() {
        guard let backgroundView = self.viewWithTag(backgroundViewTag) else {
            return
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            backgroundView.alpha = 0
        }) { (_) in
            backgroundView.removeFromSuperview()
        }
    }
}

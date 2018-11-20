//
//  UIViewExtension.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension UIView {

    func constraintEdgesToSuperview() {
        
        guard let superview = self.superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                                     topAnchor.constraint(equalTo: superview.topAnchor),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor)])
    }

    func loadAnimation(_ duration: TimeInterval = 0.2) {
        
        if let _ = viewWithTag(10) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
            lockView.tag = 10
            lockView.alpha = 0.0
            let activity = UIActivityIndicatorView(style: .white)
            activity.hidesWhenStopped = true
            
            activity.center = lockView.center
            
            activity.translatesAutoresizingMaskIntoConstraints = false
            
            lockView.addSubview(activity)
            activity.startAnimating()
            
            self.addSubview(lockView)
            
            let xCenterConstraint = NSLayoutConstraint(item: activity, attribute: .centerX, relatedBy: .equal, toItem: lockView, attribute: .centerX, multiplier: 1, constant: 0)
            
            let yCenterConstraint = NSLayoutConstraint(item: activity, attribute: .centerY, relatedBy: .equal, toItem: lockView, attribute: .centerY, multiplier: 1, constant: 0)
            
            
            NSLayoutConstraint.activate([xCenterConstraint, yCenterConstraint])
            
            UIView.animate(withDuration: duration, animations: {
                lockView.alpha = 1.0
            })
        }
    }
    
    func unload(_ duration: TimeInterval = 0.2) {
        if let lockView = self.viewWithTag(10) {
            
            UIView.animate(withDuration: duration, animations: {
                lockView.alpha = 0.0
                }, completion: { finished in
                    lockView.removeFromSuperview()
            })
        }
    }
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 6
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
}

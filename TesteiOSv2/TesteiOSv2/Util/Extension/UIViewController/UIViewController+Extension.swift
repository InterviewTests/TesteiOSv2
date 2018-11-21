//
//  UIViewController+Extension.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 21/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

extension UIViewController {
    @available(iOS 10.0, *)
    func showLoadActivity(activityStyle: UIActivityIndicatorView.Style = .whiteLarge, blurStyle: UIBlurEffect.Style = .regular) {
        
        DispatchQueue.main.async {
            let activityView = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
            activityView.frame = CGRect(x: 0.0, y: 0.0, width: 75.0, height: 75.0)
            activityView.backgroundColor = UIColor.clear
            activityView.center = CGPoint(x: self.view.frame.width/2.0, y: self.view.frame.height/2.0)
            activityView.layer.cornerRadius = 10.0
            activityView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
            activityView.layer.shadowColor = UIColor.black.cgColor
            activityView.layer.shadowRadius = 7.0
            activityView.layer.shadowOpacity = 0.2
            activityView.layer.masksToBounds = true
            activityView.tag = 999
            self.addMotionEffect(to: activityView)
            
            let activityIndicator = UIActivityIndicatorView(style: activityStyle)
            activityIndicator.center = CGPoint(x: activityView.frame.width/2.0, y: activityView.frame.height/2.0)
            activityIndicator.hidesWhenStopped = true
            
            activityView.contentView.addSubview(activityIndicator)
            
            self.view.addSubview(activityView)
            activityIndicator.startAnimating()
        }
    }
    
    private func addMotionEffect(to view: UIView) {
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        view.addMotionEffect(group)
    }
    
    func hideLoadActivity() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter({ $0.tag == 999 }).first {
                activityIndicator.removeFromSuperview()
            }
        }
    }
}


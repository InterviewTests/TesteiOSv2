//
//  UIView+Extension.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 13/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import UIKit

extension UIView{
    func addRadius(radius: CGFloat = 4.0 ){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func addShadow(){
        layer.shadowColor   = #colorLiteral(red: 0.2974309027, green: 0.3922638893, blue: 0.9480091929, alpha: 0.3)
        layer.shadowOffset  = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 6.0
        layer.shadowRadius  = 0.0
    }

    func addShadowTable(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 5
    }
    
    func activityStartAnimating() {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 150, height: 150))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }

}

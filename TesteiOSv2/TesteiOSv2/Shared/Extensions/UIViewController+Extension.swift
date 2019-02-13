//
//  UIViewController+Extension.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 13/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showLoading() {
        
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        backgroundView.tag = 666

        var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        activityIndicatorView.alpha = 0.5
        activityIndicatorView.center = self.view.center
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.layer.cornerRadius = 10
        activityIndicatorView.backgroundColor = .black
        activityIndicatorView.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicatorView.startAnimating()
        
        backgroundView.addSubview(activityIndicatorView)
        
        self.view.addSubview(backgroundView)
        self.view.isUserInteractionEnabled = false

    }
    
    func hideLoading() {
        if let background = self.view.viewWithTag(666){
            background.removeFromSuperview()
        }
        self.view.isUserInteractionEnabled = true
    }
    
    func showAlert(title: String?, message: String? = nil, titleFirstButton: String, titleSecondButton: String? = nil, callbackFirstButton:(TypeAliasForAlertAction)? = nil, callbackSecondButton: (TypeAliasForAlertAction)? = nil) {
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert )
        
        let firstAction = UIAlertAction.init(title: titleFirstButton, style: .default, handler: { alertAction in
            callbackFirstButton?(alertAction)
        })
        alert.addAction(firstAction)
        
        if let titleSecondButton = titleSecondButton {
            let secondAction = UIAlertAction.init(title: titleSecondButton, style: .default, handler: { alertAction in
                callbackSecondButton?(alertAction)
            })
            alert.addAction(secondAction)
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


//
//  UIViewController+Extension.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 30/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import UIKit
var vSpinner: UIView?

extension UIViewController {

    func showError(buttonLabel: String, titleError: String, messageError: String) {
        let error = ValidationError(titleError: titleError, messageError: messageError)
        
        let alert: UIAlertController = UIAlertController(title: error.domain, message: error.localizedDescription, preferredStyle: .alert)
        let actionOk: UIAlertAction = UIAlertAction(title: buttonLabel, style: .default, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoading(onView : UIView) {
        
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

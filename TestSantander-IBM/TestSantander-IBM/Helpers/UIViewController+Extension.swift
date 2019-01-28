//
//  UIViewController+Extension.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 24/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showDefaultAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    func loadingAlert() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

}

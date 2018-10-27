//
//  UIViewController.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import UIKit

extension UIViewController{
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

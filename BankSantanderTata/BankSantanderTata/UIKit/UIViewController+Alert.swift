//
//  UIViewController+Alert.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 10/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(title: String? = nil, message: String, actionTitle: String? = nil) {
        let alertController = UIAlertController(title: title ?? StringIdentifier.alertTitle.getString(), message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle ?? StringIdentifier.buttonLabelOK.getString(), style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}


//
//  BaseView.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation
import UIKit

protocol BaseView{
    func showMessageError(message: String)
}

extension UIViewController: BaseView {
    
    func showMessageError(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }
    
    
}

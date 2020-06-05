//
//  ViewController.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 04/06/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func showOkAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//
//  UIViewController+Extension.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 16/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import UIKit

extension UIViewController{
    func openAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


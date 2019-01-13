//
//  UIViewControllerExtension.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 11/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    self.present(alertController, animated: true)
  }
}

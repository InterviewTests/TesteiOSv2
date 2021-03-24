//
//  extensionUIViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import UIKit

extension UIViewController
{
    
    func alert(message: String, title: String = "")
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

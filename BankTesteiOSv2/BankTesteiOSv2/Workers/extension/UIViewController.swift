//
//  extensionUIViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import UIKit

extension UIViewController
{
      
      func showErrorAlert(_ error: String)
      {
            let loginErrorMessage = error
            
            self.alert(message: loginErrorMessage, title: "Atenção")
      }
      
      func alert(message: String, title: String = "")
      {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion: nil)
      }
      
}

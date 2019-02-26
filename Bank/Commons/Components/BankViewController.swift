//
//  BankVC.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import UIKit

class BankViewController: UIViewController {
    
    func showErrorMessage(message: String){
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true)
    }
    
}

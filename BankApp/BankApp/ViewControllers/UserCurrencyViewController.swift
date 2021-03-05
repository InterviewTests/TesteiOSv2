//
//  UserCurrencyViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import UIKit


class UserCurrencyViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    var userAccount: UserAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
                
        
    }        
}

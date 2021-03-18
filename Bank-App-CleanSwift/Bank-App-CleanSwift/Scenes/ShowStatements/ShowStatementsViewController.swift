//
//  ShowStatementsViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import UIKit

class ShowStatementsViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAccountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    @IBAction func exitButtonPressed(_ button: UIButton) {
        print("Exiting...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBar()
    }
}



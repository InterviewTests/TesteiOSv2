//
//  ViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.dismissKey()
    }
        
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("\(userText.text!) \(passwordText.text!)")
    }
    
}


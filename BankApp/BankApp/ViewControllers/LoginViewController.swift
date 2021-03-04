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
        if let alert = AlertFactory.createAlertBasedOnContentsOf(userText: userText?.text,
                                                                 passwordText: passwordText?.text) {
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: IDENTIFIERS.SEGUE_NAME, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


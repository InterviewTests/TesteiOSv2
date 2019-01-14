//
//  ViewController.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 10/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        if validateUserAndPassword() {
            if let user = userTextField.text, let password = passwordTextField.text {
                TesteAPIManager.shared.login(withLogin: user, andPassword: password, failure: { (error) in
                    self.presentMessage(error ?? "Tivemos um problema, tente novamente.")
                }) { (userResult) in
                    if let errorMessage = userResult?.error?.message {
                        self.presentMessage(errorMessage)
                    }
                }
            }
        }
    }
    
    func validateUserAndPassword() -> Bool {
        
        if userTextField.text?.isEmpty ?? true {
            self.presentMessage("Por favor, insira um usuário")
            return false
        } else {
            if passwordTextField.text?.isValidPassord() ?? false { return true }
            else {
                self.presentMessage("A senha deve ter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico")
                return false
            }
        }
    }
    
}



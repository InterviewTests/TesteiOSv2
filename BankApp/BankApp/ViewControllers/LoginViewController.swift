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
        let isTextFieldsNotEmpty = assertTextFieldNotEmpty()
        var phrase = "Parece que:\n\n"
        
        if isTextFieldsNotEmpty {
            let userNameString = userText.text!
            let userPasswordString = passwordText.text!
                                        
            let isUserValid = LoginValidation.validateEmail(userNameString) || LoginValidation.validateCpf(userNameString)
            let isPasswordValid = LoginValidation.validatePassword(userPasswordString)
            
            if (!isUserValid || !isPasswordValid) {
                
                if !isUserValid {
                    phrase += "O usuário informado está em um padrão inválido\n"
                    
                    if !isPasswordValid {
                        phrase += "\n\n"
                    }
                }
                        
                if !isPasswordValid {
                    phrase += "A senha informada está em um padrão inválido\n"
                }
                
                createAlert(withMessage: phrase)
            } else {
                print("pode entrar \(userNameString) \(userPasswordString)")
            }
        } else {
            if !userText.hasText {
                phrase += "O campo 'usuário' está em branco\n"
            }
            if !passwordText.hasText {
                phrase += "O campo 'senha' está em branco\n"
            }
            createAlert(withMessage: phrase)
        }
    }
    
    private func assertTextFieldNotEmpty() -> Bool {
        return userText.hasText && passwordText.hasText
    }
    
    private func createAlert(withMessage message: String) {
        let alert = UIAlertController(title: "Algo estranho ocorreu...", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Vou verificar!", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}


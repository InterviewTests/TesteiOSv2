//
//  LoginViewController.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var textFieldUser: UITextField!
    @IBOutlet private weak var textFieldPassword: UITextField!
    
    @IBOutlet private weak var labelValidateMessage: UILabel!
    
    @IBOutlet private weak var buttonLogin: UIButton!
    
    var presenter: LoginPresenterProtocol!
    var userDefauts = "user"
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        clearFields()
        labelValidateMessage.isHidden = true
        buttonLogin.layer.cornerRadius = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textFieldUser.text = recoveryUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearFields()
        labelValidateMessage.isHidden = true
    }
    
    // MARK: -IBActions
    @IBAction func didClickedLogin(_ sender: Any) {
        
        if let user = textFieldUser.text,
            let password = textFieldPassword.text {
            if user.isEmpty {
                labelValidateMessage.isHidden = false
                labelValidateMessage.text = "Entrar com usuário"
                return
            } else if !isValidUser(user: user) {
                labelValidateMessage.isHidden = false
                labelValidateMessage.text = "Entrar com usário válido"
                return
            } else if password.isEmpty {
                labelValidateMessage.isHidden = false
                labelValidateMessage.text = "Usuário ou senha incorretos"
                return
            } else if !isValidPassword(password: password) {
                labelValidateMessage.isHidden = false
                labelValidateMessage.text = "Usuário ou senha incorretos"
                return
            }
            UserDefaults.standard.set(textFieldUser.text, forKey: userDefauts)
            presenter.buttonLoginPressed(userName: textFieldUser.text, password: textFieldPassword.text)
        }

    }
    
    // MARK: - Setup Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func recoveryUser() -> String {
        if let userRecovery = UserDefaults.standard.object(forKey: userDefauts){
            return userRecovery as! String
        }
        return ""
    }
    
}

func isValidUser(user:String) -> Bool {
    let userRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let userSelf = NSPredicate(format:"SELF MATCHES %@", userRegEx)
    return userSelf.evaluate(with: user)
}

func isValidPassword(password:String) -> Bool {
    let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,10}"
    let pass = NSPredicate(format:"SELF MATCHES %@", passRegEx)
    return pass.evaluate(with: password)
}

// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    func showAlert(message: String) {
        presentAlert(message: message)
    }
    
    func clearFields() {
        textFieldUser.text = String()
        textFieldPassword.text = String()
    }
    
}

//
//  LoginViewController.swift
//  TesteiOS
//
//  Created by Douugr on 14/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet private weak var loginView: LoginView! {
        didSet {
            loginView.delegate = self
        }
    }
    
    var loginProvider = LoginProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginProvider.delegate = self

    }
}

extension LoginViewController {
    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func confirmLogin(userData: UserAccount) {

        User.name = userData.name
        User.userId = userData.userId
        User.bankAccount = userData.bankAccount
        User.balance = userData.balance
        User.agency = userData.agency
        
        self.performSegue(withIdentifier: "confirmLogin", sender: self)
        
    }
    
}

extension LoginViewController: LoginViewDelegate {
    func error() {
        self.showError(title: "Erro no login", message: "Usuário ou senha incorretos, por favor tente novamente.")
    }
    
    func login(user: String, password: String) {
        self.loginProvider.makeLogin(username: user, password: password)
    }
}

extension LoginViewController: LoginProviderDelegate {
    func connectionError() {
        self.showError(title: "Erro de conexão", message: "Erro de conexão. Cheque sua conexão com a internet. Caso não resolva, entre em contato conosco.")
    }
    
    func success(user: UserAccount) {
        self.confirmLogin(userData: user)
    }
    
    func failure(error: UserError) {
        self.showError(title: "Erro no login", message: "Usuário ou senha incorretos, por favor tente novamente.")
    }
    
    
}

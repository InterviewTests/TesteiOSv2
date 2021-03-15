//
//  LoginViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 14/03/21.
//

import UIKit

protocol DisplayLoginLogic: class {
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel)
}

class LoginViewController: UIViewController, DisplayLoginLogic {
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    var interactor: LoginBusinessLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                            
        self.roundButtonCorners()
        self.dismissKey()
        
        self.setupCleanSwiftObjects()
    }
    

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let username = userText.text, let password = passwordText.text {
            let request = Login.Login.Request(fields: Login.LoginFields(username: username,
                                                                        password: password))
            
            interactor.applyBusinessLogicIn(request: request)
        } else {
            print("epa")
        }
        
    }
    
    private func setupCleanSwiftObjects() {
        let viewController = self
        viewController.interactor = LoginInteractor()        
    }
    
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel) {
        
    }
}

// MARK: - Extension
extension LoginViewController {
    /// Dismisses the keyboard when the app's user taps outside the textview
    private func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func roundButtonCorners() {
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
    }
}

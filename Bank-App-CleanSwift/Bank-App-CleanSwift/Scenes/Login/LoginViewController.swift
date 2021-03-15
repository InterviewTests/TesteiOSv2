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
        let username = userText.text!
        let password = passwordText.text!
                
        let request = Login.Login.Request(fields: Login.LoginFields(username: username,
                                                                    password: password))
        interactor.applyBusinessLogicIn(request: request)        
    }
    
    private func setupCleanSwiftObjects() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel) {
        print("Fiz o ciclo VIP básico com o usuario \(viewModel.user!.username) \(viewModel.user!.password)")
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

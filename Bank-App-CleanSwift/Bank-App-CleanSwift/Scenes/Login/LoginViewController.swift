//
//  LoginViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 14/03/21.
//

import UIKit

protocol DisplayLoginLogic: class {
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel)
    func setUsernameText(with viewModel: Login.FetchLastLoggedUser.ViewModel)
}

class LoginViewController: UIViewController, DisplayLoginLogic {
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var interactor: LoginBusinessLogic!
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBar()
        self.roundButtonCorners()
        self.dismissKey()
        self.setupCleanSwiftObjects()
        
        interactor.fetchLastLoggedUsername(request: Login.FetchLastLoggedUser.Request())
    }
    
    // MARK: -
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let username = userText.text!
        let password = passwordText.text!
                
        let request = Login.Login.Request(fields: Login.LoginFields(username: username,
                                                                    password: password))
        interactor.applyBusinessLogic(request: request)        
    }
    
    // MARK: - Setup Clean Swift's architecture objects
    private func setupCleanSwiftObjects() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: -
    /// Based on `viewModel` contents, show an alert informing an error, or passes by the object to the next view
    /// - Parameter viewModel: a `ViewModel` which can contain an `ErrorMessage` or an `UserAccount`
    func displayLoginSuccessful(viewModel: Login.Login.ViewModel) {
        guard viewModel.user != nil else {
            self.presentErrorAlert(containing: viewModel.error!.message!)
            return 
        }
        
        performSegue(withIdentifier: Constants.SEGUE_ID_TO_STATEMENTS, sender: nil)
    }
        
    // MARK: -
    /// Presents an customized error alert
    /// - Parameter errorMessage: the message that tells the error occurred
    private func presentErrorAlert(containing errorMessage: String) {
        let alertController = UIAlertController(title: Constants.DEFAULT_ALERT_TITLE,
                                                message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.DEFAUTL_ALERT_BUTTON_CAPTION, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
    // MARK: - 
    func setUsernameText(with viewModel: Login.FetchLastLoggedUser.ViewModel) {
        self.userText.text = viewModel.username
    }
}

// MARK: - Extension
extension LoginViewController {
    /// Dismisses the keyboard when the app's user taps outside the textview
    private func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(LoginViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    /// Objective-C-like method used in selector
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    /// Rounds the border of the Login Button.
    private func roundButtonCorners() {
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
    }
}

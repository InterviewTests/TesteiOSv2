//
//  LoginViewController.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func showAccountDetails()
    func displayErrorMessage(withTitle title: String, message: String)
}

class LoginViewController: UIViewController {
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    // MARK: Login
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let user = userTextField.text, let password = passwordTextField.text else {
            return
        }
        
        let request = Login.Fetch.Request(user: user, password: password)
        interactor?.fetchLogin(request)
    }
}

// MARK: - UI Setup
private extension LoginViewController {
    
    func setupUI() {
        setupLoginButton()
        setupUserTextField()
        setupPasswordTextField()
        
        userTextField.text = "sd@lasd.com"
        passwordTextField.text = "12Ffs#"
    }
    
    func setupUserTextField() {
        userTextField.delegate = self
        userTextField.placeholder = "User"
        userTextField.keyboardType = .emailAddress
        passwordTextField.font = UIFont.systemFont(ofSize: 15.0)
    }
    
    func setupPasswordTextField() {
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 15.0)
    }
    
    func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .appBlue
        loginButton.tintColor = .white
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        loginButton.layer.cornerRadius = 4.0
        loginButton.setShadow(color: .appBlueShadow, offset: CGSize(width: 0, height: 4))
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}


// MARK: - LoginDisplayLogic
extension LoginViewController: LoginDisplayLogic {
    
    func showAccountDetails() {
        router?.routeToAccountDetails(segue: nil)
    }
    
    func displayErrorMessage(withTitle title: String,
                             message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

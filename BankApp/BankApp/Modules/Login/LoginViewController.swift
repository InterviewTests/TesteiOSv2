//
//  LoginViewController.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

class LoginViewController: UIViewController, LoginFormProtocol {
    
    // MARK: Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var field_username: UITextField!
    @IBOutlet weak var field_password: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var interactor: LoginInteractorProtocol?
    
    // LoginFormProtocol
    var username: String? { return field_username.text }
    var password: String? { return field_password.text }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        LoginRouter.createModule(view: self)
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func setupView() {
        self.addKeyboardObserver(for: scrollView, named: "LoginVC")
    }
    
    
    // MARK: - Methods
    
    private func loading() {
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    private func loaded() {
        activityIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func closeKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

}


// MARK: - Presenter Delegate Methods

extension LoginViewController: LoginPresenterDelegate {
    
}

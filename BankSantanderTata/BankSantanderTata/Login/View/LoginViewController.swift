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
    
    var presenter: LoginPresenterProtocol!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
        setupLabels()
        applyStyle()
        clearFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearFields()
    }
    
    // MARK: - Setup Methods
    private func setupAccessibilityIdentifiers() {
        
    }
    
    private func setupLabels() {
        
    }
    
    private func applyStyle() {
        
    }
    
    @IBAction func didClickedLogin(_ sender: Any) {
        presenter.buttonLoginPressed(userName: "", password: "")
    }
}



// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    
    func clearFields() {
        textFieldUser.text = String()
        textFieldPassword.text = String()
    }
    
}

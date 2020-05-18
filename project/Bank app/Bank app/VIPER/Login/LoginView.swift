//
//  LoginView.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class LoginView: BaseView<LoginPresenterProtocol> {

    let screenName = "Login"
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeUI()
        self.i18N()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        self.presenter?.performLogin()
    }
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension LoginView: BaseViewControllerRefresh {
    func refresh() {
        //TODO: implement all calls needed to refresh the UI
    }
    
    func i18N() {
        self.title = "Login"
        self.loginButton.setTitle("Login.LoginButton".localized, for: .normal)
        self.usernameTextfield.placeholder = "Login.UsernameTextField".localized
        self.passwordTextfield.placeholder = "Login.PasswordTextfield".localized
    }
    
    func initializeUI() {
        self.usernameTextfield.delegate = self
        self.passwordTextfield.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }
}


extension LoginView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == usernameTextfield { // Switch focus to passwordTextfield
            passwordTextfield.becomeFirstResponder()
        }
        return true
    }
}

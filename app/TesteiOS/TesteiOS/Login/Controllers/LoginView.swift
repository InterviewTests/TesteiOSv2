//
//  LoginView.swift
//  TesteiOS
//
//  Created by Douugr on 14/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: NSObjectProtocol {
    func login(user: String, password: String)
    func error()
}

class LoginView: UIView {
    
    @IBOutlet private var loginView: UIView!

    @IBOutlet private weak var userTextField: UITextField! {
        didSet {
            userTextField.accessibilityIdentifier = "userTextField"
            userTextField.delegate = self
        }
    }
    @IBOutlet private weak var passwdTextField: UITextField! {
        didSet {
            passwdTextField.accessibilityIdentifier = "passwdTextField"
            passwdTextField.delegate = self
        }
    }
    
    @IBOutlet private weak var loginButton: UIButton! {
        didSet {
            loginButton.accessibilityIdentifier = "loginButton"
        }
    }
    
    weak var delegate: LoginViewDelegate?
    
    @IBAction func loginAction(_ sender: Any) {
        let username = userTextField.text ?? ""
        let password = passwdTextField.text ?? ""
        self.checkUserEntry(user: username, password: password)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(self.loginView)
        self.loginView.frame = self.bounds
        self.loginView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.setButtonLayout()
    }
    
    

}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setButtonLayout() {
        loginButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        loginButton.layer.shadowOpacity = 1.0
        loginButton.layer.shadowRadius = 0.0
        loginButton.layer.masksToBounds = false
        loginButton.layer.cornerRadius = 4.0
    }

    func checkUserEntry(user: String, password: String) {
        let userRange = NSRange(location: 0, length: user.utf16.count)
        let userCpfRegex = try! NSRegularExpression(pattern: "[0-9]{3}\\.?[0-9]{3}\\.?[0-9]{3}\\-?[0-9]{2}")
        let userEmailRegex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        
        if userCpfRegex.firstMatch(in: user, options: [], range: userRange) != nil {
            self.checkPasswordEntry(user: user, password: password)
            return
        } else if userEmailRegex.firstMatch(in: user, options: [], range: userRange) != nil {
            self.checkPasswordEntry(user: user, password: password)
            return
        } else {
            delegate?.error()
            return
        }
    }
    
    func checkPasswordEntry(user: String, password: String) {
        let passwordRange = NSRange(location: 0, length: password.utf16.count)
        let passwordRegex = try! NSRegularExpression(pattern: "(?=.*[A-Z])(?=.*[0-9])(?=.*\\W)")
        
        if passwordRegex.firstMatch(in: password, options: [], range: passwordRange) != nil {
                self.delegate?.login(user: user, password: password)
            return
        } else {
            delegate?.error()
            return
        }
    }
    
}

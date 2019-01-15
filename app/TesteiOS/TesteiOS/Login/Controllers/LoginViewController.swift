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

    }
}

extension LoginViewController: LoginViewDelegate {
    func login(user: String, password: String) {
        self.loginProvider.makeLogin(username: user, password: password)
    }
    
    
}

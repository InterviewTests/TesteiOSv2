//
//  LoginViewController.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: AnyObject { }

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var interactor: LoginBusinessLogic?
    var coordinator: LoginViewControllerDelegate?
    
}

extension LoginViewController: LoginDisplayLogic { }

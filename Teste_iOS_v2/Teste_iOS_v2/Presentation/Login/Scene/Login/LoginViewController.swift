//
//  LoginViewController.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displaySuccessLogin()
    func displayErrorLogin(_ error: UIViewController)
}

class LoginViewController: UIViewController {

    @IBOutlet private(set) weak var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    var interactor: LoginBusinessLogic?
    var coordinator: LoginViewControllerDelegate?
    
}

extension LoginViewController: LoginDisplayLogic {
    func displaySuccessLogin() {
        coordinator?.didMadeLogin()
    }
    
    func displayErrorLogin(_ error: UIViewController) {
        coordinator?.showError(error)
    }
}

extension LoginViewController: LoginViewProtocol {
    func didTapLoginButton(username: String?, password: String?) {
        interactor?.validateLogin(username: username, password: password)
    }
}

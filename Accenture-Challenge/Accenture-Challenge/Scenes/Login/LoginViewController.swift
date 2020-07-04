//
//  LoginViewController.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func routeToPayments()
}

class LoginViewController: UIViewController {
    
    private lazy var userTextField: UITextField = {
        return UITextField(frame: .zero)
    }()
    
    private lazy var passwordTextField: UITextField = {
        return UITextField(frame: .zero)
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginView: LoginView = {
        return LoginView(frame: .zero,
                         userTextField: userTextField,
                         passwordTextField: passwordTextField,
                         loginButton: loginButton)
    }()
    
    private var interactor: LoginBusinessLogic?
    private var router: LoginRouterProtocol?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor(viewController: viewController)
        let router = LoginRouter()
        router.viewController = viewController
        viewController.router = router
        viewController.interactor = interactor
        router.dataStore = interactor
    }
}

extension LoginViewController {
    
    @objc
    private func didTapLoginButton() {
        guard let user = userTextField.text, let password = passwordTextField.text else { return }
        let request = Login.Info.LoginRequest(user: user, password: password)
        interactor?.fetchLogin(request: request)
    }
}

extension LoginViewController: LoginDisplayLogic {
    
    func routeToPayments() {
        
    }
}

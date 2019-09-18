//
//  LoginViewController.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import UIKit
import Hero

protocol LoginViewControllerProtocol {
    func displayStatementScreen(with data: UserAccount)
}

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Properties
    var interactor: LoginInteractorProtocol?
    let router = LoginRouter()
    
    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupLayout()
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: Actions
    @IBAction func didTapLoginButton(_ sender: Any) {
        let info = LoginModel.loginInfo(user: userTextfield.text ?? "",
                                        password: passwordTextfield.text ?? "")
        
        interactor?.performUserLogin(with: info)
    }
    
    // MARK: Navigation
    private func setupNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Layout
    private func setupLayout() {
        navigationController?.hero.isEnabled = true
        loginButton.hero.id = BankConstants.loginButtonId
    }
    
}

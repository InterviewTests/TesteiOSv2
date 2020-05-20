//
//  LoginViewController.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func displayStatementsSuccess(viewModel: Login.ViewModel)
    func displayStatementsError(viewModel: Login.ViewModel)
    func displayUserData(viewModel: Login.ViewModel)
}

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height * 0.10
        interactor?.getUserData(request: Login.Request(user: User()))
        keyboard()
    }
    
    func keyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
      view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        tellStatements()
    }
    
    func tellStatements() {
        startProgress()
        let request = Login.Request(user: User(user: userTextField.text ?? "", password: passwordTextField.text ?? ""))
        interactor?.tellStatements(request: request)
    }
}

extension LoginViewController: LoginDisplayLogic {
    func displayUserData(viewModel: Login.ViewModel) {
        guard let user = viewModel.user else { return }
        userTextField.text = user.user
        passwordTextField.text = user.password
    }
    
    func displayStatementsError(viewModel: Login.ViewModel) {
        closeProgress()
        AlertManager().showAlertController(body: viewModel.error?.message ?? "", title: "Error" , theme: .error)
    }
    
    func displayStatementsSuccess(viewModel: Login.ViewModel) {
        router?.routeToStatements()
        closeProgress()
    }
}

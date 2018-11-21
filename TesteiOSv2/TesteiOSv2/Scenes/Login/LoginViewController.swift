//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 17/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit


protocol LoginPresenterOutput: class {
    func displayLoginErrorMessage(viewModel: Login.ViewModelFailedLogin)
    func displaySuccessfullLogin(viewModel: Login.ViewModelSuccessfullLogin)
    func loadingView()
}

class LoginViewController: BaseViewController {
    // MARK: IBOutlet
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    var interactor: LoginBusinessLogic?
    var router:LoginRouter?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Setup
    private func setup()
    {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        router.loginViewController = viewController
        presenter.viewController = viewController
    }
    
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDataUser()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let user = usernameTextField.text
        let password = passwordTextField.text
        let request = Login.Request(userName: user, password: password)
        interactor?.perfomLogin(request:request)
    }
    
    func loadDataUser() {
        if let username = UserSession.current.getUsername(),let pass = UserSession.current.getPass() {
            usernameTextField.text = username
            passwordTextField.text = pass
        }
    }
    
}

extension LoginViewController: LoginPresenterOutput {
    func loadingView() {
        self.showLoadActivity()
    }
    
    func displayLoginErrorMessage(viewModel: Login.ViewModelFailedLogin) {
        self.hideLoadActivity()
        AlertUtils.showAlertError(title:viewModel.message, viewController:self)
    }
    
    func displaySuccessfullLogin(viewModel: Login.ViewModelSuccessfullLogin) {
        self.hideLoadActivity()
        self.router?.goToHomeScreen()
    }
}

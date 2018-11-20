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
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let user = usernameTextField.text
        let password = passwordTextField.text
        let request = Login.Request(userName: user, password: password)
        interactor?.perfomLogin(request:request)
    }
}

extension LoginViewController: LoginPresenterOutput {
    func displayLoginErrorMessage(viewModel: Login.ViewModelFailedLogin) {
        AlertUtils.showAlertError(title:viewModel.message, viewController:self)
    }
    
    func displaySuccessfullLogin(viewModel: Login.ViewModelSuccessfullLogin) {
        self.router?.goToHomeScreen()
    }
}

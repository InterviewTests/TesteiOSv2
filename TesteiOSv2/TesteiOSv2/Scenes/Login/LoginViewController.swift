//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func sendToStatements(viewModel: Login.LoginUser.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol)?
    
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let user = self.userTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        
        let request = Login.LoginUser.Request(loginFormFields: Login.LoginFormFields(user: user, password: password))
        self.interactor?.loginUser(request: request)
    }
    
    func sendToStatements(viewModel: Login.LoginUser.ViewModel) {
        let storyboard = UIStoryboard(name: "Statements", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StatementsID")
        self.present(controller, animated: true, completion: nil)
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
    }
}

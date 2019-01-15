//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController, UITextFieldDelegate{
    
    ///This viewController interactor
    var interactor : LoginBussinessLogic?
    var router : (LoginRoutingLogic & LoginDataPassing)?
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        username.delegate = self
        password.delegate = self
    }

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
    
    /**
     Setup UpcomingMovieListViewController protocols.
     */
    private func setup()
    {
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
    
    
    @IBAction func loginAction(_ sender: Any) {
        guard let usernameText = username.text, let passwordText = password.text else {
            return
        }
        interactor?.login(user: usernameText, password: passwordText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController : LoginViewControllerProceed{
    func callALertController(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
    
    func goToNextViewController() {
        self.router?.routeToAccountDetail()
    }
    
    
}

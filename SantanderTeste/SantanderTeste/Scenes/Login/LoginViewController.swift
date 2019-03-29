//
//  LoginViewController.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import UIKit

import UIKit

protocol LoginDisplayLogic: class
{
    func displayFetchLogin(viewModel: Login.fetchlogin.ViewModel)
    func displayError(error: String)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    func displayError(error: String) {
        self.present(CallFeedBack().feedbackError(error: error), animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    @IBOutlet weak var loginButtonView: UIButton!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var displayLogin: Login.fetchlogin.ViewModel.DisplayViewModel? = nil
    
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
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }
  
    func setupView(){
        loginButtonView.applyShadow()
        loadingView.isHidden = true
        activityLoading.isHidden = true
    }
    func setupViewLoading(){
        loadingView.isHidden = false
        activityLoading.isHidden = false
        activityLoading.startAnimating()
    }
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        setupViewLoading()
        fetchLogin()
    }
    
    func displayFetchLogin(viewModel: Login.fetchlogin.ViewModel) {
        router?.routeToStatementDetails(display:  viewModel.displayLogin)
    }
    
    
    func fetchLogin(){
        let request = Login.fetchlogin.Request(user: userTextField.text!, password: passwordTextField.text!)
        interactor?.fetchLogin(request: request)
    }
    
}

extension LoginViewController: UITextFieldDelegate{

   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }

}

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
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
        
   
    }
  
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
       // router?.routeToStatementDetails(display: displayLogin!)
         if validateLoginData(){
            fetchLogin()
        }
        
    }
    
    func displayFetchLogin(viewModel: Login.fetchlogin.ViewModel) {
        displayLogin = viewModel.displayLogin
        router?.routeToStatementDetails(display: displayLogin!)
    }
    
    func validateLoginData() -> Bool { 
        if Rules().verifyPassword(Password: passwordTextField.text!) &&  Rules().isValidUser(user: userTextField.text!){
            return true
        }
        return false
    }
    
    func fetchLogin(){
        let request = Login.fetchlogin.Request(user: userTextField.text!, password: passwordTextField.text!)
        interactor?.fetchLogin(request: request)
    }
    
    
    
   
}

extension LoginViewController: UITextFieldDelegate{
    func setupTextFild(){
        self.userTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.userTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.view.endEditing(true)
    }
}

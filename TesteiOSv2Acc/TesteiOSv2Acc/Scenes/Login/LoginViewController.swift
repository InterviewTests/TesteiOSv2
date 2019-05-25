//
//  LoginViewController.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
    func displaySavedLoginData(viewModel: Login.LoadLoginData.ViewModel)
    func displayLoggedInUser(viewModel: Login.LoginUser.ViewModel)
}

class LoginViewController: UIViewController
{
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupHideKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadLoginDataIfExists()
    }
    
    // MARK: IBActions
    
    @IBAction func loginAction(_ sender: Any) {
        doLogin()
    }
    
    // MARK: - Interactor communication
    
    private func loadLoginDataIfExists(){
        let request = Login.LoadLoginData.Request()
        interactor?.loadLoginDataIfExists(request: request)
    }
    
    private func doLogin()
    {
        if let user = userTextField.text,
            let password = userTextField.text{
            let request = Login.LoginUser.Request(user: user, password: password)
            interactor?.doLogin(request: request)
        }
        
    }
    
}

// MARK: - Login display logic

extension LoginViewController: LoginDisplayLogic{
    
    func displayLoggedInUser(viewModel: Login.LoginUser.ViewModel) {
        
        if let serviceError = viewModel.serviceError, let message = serviceError.message{
            let title = "Error"
            AlertManager.showOkAlert(context: self, title: title, message: message)
        }else{
            router?.routeToStatements(segue: nil)
        }
        
    }
    
    func displaySavedLoginData(viewModel: Login.LoadLoginData.ViewModel)
    {
        userTextField.text = viewModel.user
        passwordTextField.text = ""
    }
    
}

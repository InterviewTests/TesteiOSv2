//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 10/03/20.
//  Copyright (c) 2020 Mônica Marques. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
//    func displaySomething(viewModel: Login.Something.ViewModel)
    func showAlertErrorMessage(message: String)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    // MARK: - Object lifecycle
    
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
    
    // MARK: - Setup
    
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
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.userTextField.delegate = self
        self.passwordTextField.delegate = self
        
        doSomething()
    }
    
    // MARK: - Do something
    func showAlertErrorMessage(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //MARK: - IBAction
    
    @IBAction func didTouchLoginButton(_ sender: UIButton) {
        guard let interactor = self.interactor,
              let user = self.userTextField.text,
              let password = self.passwordTextField.text else {return}
        
        if !interactor.validateUser(user) {
            return
        }
        
        if !interactor.validatePassword(password) {
            return
        }
        
        let request = Login.Request(user: user,
                                    password: password)
        self.interactor?.tryLogin(request)
    }
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
//        let request = Login.Something.Request()
    }
    
//    func displaySomething(viewModel: Login.Something.ViewModel)
//    {
//        //nameTextField.text = viewModel.name
//    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

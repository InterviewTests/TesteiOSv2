//
//  LoginFormViewController.swift
//  TesteSantader
//
//  Created by Bruno Chen on 05/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

protocol LoginFormDisplayLogic: class {
    func displayLogin(viewModel: LoginForm.Login.ViewModel)
    func displayExistentUser(userID: String?, password: String?)
    func login()
}

class LoginFormViewController: UIViewController, LoginFormDisplayLogic {
    
    var interactor: LoginFormBusinessLogic?
    var router: (NSObjectProtocol & LoginFormRoutingLogic & LoginFormDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    

    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginFormInteractor()
        let presenter = LoginFormPresenter()
        let router = LoginFormRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds (to: selector) {
                router.perform(selector, with: segue)
            }
        }
        
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        verifyExistentUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        passwordTextField.text = ""
        userIDEmailTextField.text = ""
        verifyExistentUser()
    }
    
    // MARK: - Login
    
    @IBOutlet weak var userIDEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        login()
    }
    
    func verifyExistentUser() {
        interactor?.verifyExistentUser()
    }
    
    
    func displayExistentUser(userID: String?, password: String?) {
        passwordTextField.text = password
        userIDEmailTextField.text = userID
    }
    
    func login() {
        let userIDEmail = userIDEmailTextField.text
        let password = passwordTextField.text
        let request = LoginForm.Login.Request(userID: userIDEmail, password: password)
        interactor?.login(request: request)
    }
    
    func displayLogin(viewModel: LoginForm.Login.ViewModel) {

        if viewModel.success {
            performSegue(withIdentifier: "ShowUser", sender: nil)
        } else {
            userIDEmailTextField.text = nil
            passwordTextField.text = nil
        }
        
    }

}

//
//  LoginViewController.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func showAccountDetails()
    func displayErrorMessage(_ message: String)
}

class LoginViewController: UIViewController {
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    // MARK: Setup
    
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
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let scene = segue.identifier {
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//        if let router = router, router.responds(to: selector) {
//          router.perform(selector, with: segue)
//        }
      }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
    // MARK: Login
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let user = userTextField.text, let password = passwordTextField.text else {
            return
        }
        
        let request = Login.Fetch.Request(user: user, password: password)
        interactor?.fetchLogin(request)
    }
}

// MARK: - LoginDisplayLogic
extension LoginViewController: LoginDisplayLogic {
    
    func showAccountDetails() {
        router?.routeToAccountDetails(segue: nil)
    }
    
    func displayErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

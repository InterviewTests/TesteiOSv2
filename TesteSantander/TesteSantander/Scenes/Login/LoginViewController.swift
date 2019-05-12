//
//  LoginViewController.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func getData(viewModel: LoginModel.Login.ViewModel)
    func displayErrorAlert(error: String)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
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
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingView()
    }
    
    // MARK: Outlets
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loadingView: Loading?
    
    func setupLoadingView() {
        loadingView = Loading.instanceFromNib(rect: self.view.frame)
    }
    
    func removeLoadingView() {
        
    }
    
    func performLogin() {
        let request = LoginModel.Login.Request(user: userTextField.text, password: passwordTextField.text)
        interactor?.performLogin(request: request)
    }
  
    func getData(viewModel: LoginModel.Login.ViewModel) {
        self.loadingView?.activityIndicator.stopAnimating()
        self.loadingView?.removeFromSuperview()
        self.performSegue(withIdentifier: Constants.Identifiers.statementSegue, sender: self)
    }
    
    func displayErrorAlert(error: String) {
        self.loadingView?.activityIndicator.stopAnimating()
        self.loadingView?.removeFromSuperview()
        let alert = UIAlertController(title: "erro", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        guard let loading = loadingView else { return }
        loading.activityIndicator.startAnimating()
        self.view.addSubview(loading)
        performLogin()
    }
}

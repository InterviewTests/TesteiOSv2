//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func displayUserLogged(viewModel: FetchUsers.FetchUsers.ViewModel)
    func displayFetchUserError(viewModel: FetchUsers.FetchUsers.ViewModel)
}

class LoginViewController: UIViewController , LoginDisplayLogic {
    func displayFetchUserError(viewModel: FetchUsers.FetchUsers.ViewModel) {
        loading(false)
        let alert = UIAlertController(title:"Erro",message:viewModel.error,preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayUserLogged(viewModel: FetchUsers.FetchUsers.ViewModel) {
        loading(false)
        userTextfield.text = ""
        passwordTextfield.text = ""
        
        router?.routeToStatements(segue: nil)
    }
    
    
    var interactor: LoginBusinessLogic?
    var router : (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
//    var loading: LNSLoading?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let lastLogin = interactor?.lastLogin() {
            userTextfield?.text = lastLogin
        }
    }
    
    
    private func setup(){
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.worker = BankAPI()
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
//        loading = LNSLoading(self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBOutlet weak var userTextfield: LNSTextField!
    @IBOutlet weak var passwordTextfield: LNSTextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loading(true)
        let user = userTextfield.text!
        let password = passwordTextfield.text!
        
        let request = FetchUsers.FetchUsers.Request(userFormFields: FetchUsers.UserFormFields(user: user, password: password))
        interactor?.login(request: request)
        
        
    }
    private func enableButton(_ enable : Bool){
        loginButton.isEnabled = enable
    }
    private func loading(_ shouldLoading :Bool){
        enableButton(!shouldLoading)
        if shouldLoading {
            loadingIndicator?.startAnimating()
        }else{
            loadingIndicator?.stopAnimating()
        }
    }
    
    
}

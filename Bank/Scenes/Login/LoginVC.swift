//
//  LoginVC.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

protocol LoginDisplayLogic: class {
    func showErrorMessage(message: String)
    func routeShowStatement()
}

class LoginVC: BankViewController, LoginDisplayLogic, UITextFieldDelegate {
    
    @IBOutlet var txtUser: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
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
        
        btnLogin.addTarget(self, action: #selector(autenticate), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        if let userName = KeychainWrapper.standard.string(forKey: "userName") {
            txtUser.text = userName
        }
        else
        {
            txtUser.text = ""
        }
        txtPassword.text = ""
    }
    
    @objc private func autenticate() {
        interactor?.validateLoginData(user: Login.ViewModel.DiplayedUser(login: txtUser.text ?? "", password: txtPassword.text ?? ""))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(textField.tag == 2)
        {
            self.autenticate()
        }
        else
        {
            txtPassword.becomeFirstResponder()
        }
        return true
    }
    
    func routeShowStatement() {
        let selector = NSSelectorFromString("routeToShowStatement")
        if let router = router, router.responds(to: selector) {
            router.perform(selector)
        }
    }
}

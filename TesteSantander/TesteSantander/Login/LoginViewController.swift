//
//  ViewController.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 23/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol LoginResponseStatus {
    var router : LoginRouterProtocol? {get}
    func logoSuccess(account:Account)
    func logonFailure(message:String)
    func receiveLastLogon(_ logonInfo:UserLoginInfo?)
}

class LoginViewController: UIViewController, LoginResponseStatus, UITextFieldDelegate {
    
    @IBOutlet weak var txfLogin: UITextField!
    @IBOutlet weak var txfPassword : UITextField!
    @IBOutlet weak var btnLogin : UIButton!
    @IBOutlet weak var lblMessageError: UILabel!
    
    var interactor : DoLoginInteractor?
    var router : LoginRouterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScene()
        self.btnLogin.layer.cornerRadius = 5
        self.lblMessageError.isHidden = true
        self.txfPassword.delegate = self
        self.txfLogin.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.fetchLastLogon()
        
    }
    
    func setupScene(){
        
        self.interactor = LoginInteractor()
        self.interactor?.worker = LoginWorker()
        self.interactor?.presenter = LoginPresenter()
        self.interactor?.presenter?.controller = self
        self.router = LoginRouter()
        
    }
    
    func clearMessageError(){
        self.lblMessageError.text = ""
        self.lblMessageError.isHidden = true
    }
    
    func showMessageError(_ message:String) {
        self.lblMessageError.text = message
        self.lblMessageError.isHidden = false
    }
    
    // LoginResponseStatus Protocol
    
    func logoSuccess(account:Account) {
        self.router?.callPaymentsViewController(account, controller: self)
        LoadinView.stop()
    }
    
    func logonFailure(message:String) {
        LoadinView.stop()
        self.showMessageError(message)
    }
    
    func receiveLastLogon(_ logonInfo:UserLoginInfo?) {
        var usernameText = ""
        var passwordText = ""
        if let password = logonInfo?.password, let username = logonInfo?.user {
            passwordText = password
            usernameText = username
        }
        self.txfLogin.text = usernameText
        self.txfPassword.text = passwordText
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        if let user = self.txfLogin.text, let password = txfPassword.text {
            if (user.trimmingCharacters(in: .whitespaces) != "" && password.trimmingCharacters(in: .whitespaces) != "") {
                self.clearMessageError()
                LoadinView.start()
                self.interactor?.doLogin((user, password))
                return
            }
        }
        self.showMessageError(GeneralError.emptyFields.localizedDescription)
    }
    
    // TextFieldProtocol
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    

}


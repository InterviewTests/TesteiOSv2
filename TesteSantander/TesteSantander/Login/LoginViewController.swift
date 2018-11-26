//
//  ViewController.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 23/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol LoginResponseStatus {
    func logoSuccess(account:Account)
    func logonFailure(message:String)
}

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txfLogin: UITextField!
    @IBOutlet weak var txfPassword : UITextField!
    @IBOutlet weak var btnLogin : UIButton!
    
    var interactor : DoLoginInteractor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScene()
        self.btnLogin.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupScene(){
        
        self.interactor = LoginInteractor()
        self.interactor?.worker = LoginWorker()
        self.interactor?.presenter = LoginPresenter()
        
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        if let user = self.txfLogin.text, let password = txfPassword.text {
            self.interactor?.doLogin((user, password))
        }
    }
    

}


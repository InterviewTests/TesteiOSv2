//
//  LoginScreenView.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit

class LoginScreenView: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var loginLabel: UIButton!
    var passwordisValid = false
    var userisValid     = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    @IBAction func verifyPassword(_ sender: Any) {
        if Util.getFunctions.verifyPassword(Password: passwordTextFild.text!){
            passwordisValid = true
        }
    }
    @IBAction func verifyUser(_ sender: Any) {
        if Util.getFunctions.checkIfCPF(user: userTextField.text!){
            userTextField.text = Util.getFunctions.maskOfCPF(user: userTextField.text!)
           
        }
        if Util.getFunctions.isValidUser(user: userTextField.text!){
            userisValid = true
            print(Util.getFunctions.isValidUser(user: userTextField.text!))
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if passwordisValid && userisValid{
            NetworkManager.shared.formtLogin(user: userTextField.text!, password: passwordTextFild.text!)
            NetworkManager.shared.request_User {
                  self.navergar()
            }
        }else{
            self.present(FeedBack.shared.feedbackError(), animated: true, completion: nil)
        }
    }
    
    
    func navergar() {
        let escolha = self.storyboard?.instantiateViewController(withIdentifier: "accountDetails") as! AccountScreenView
        self.navigationController?.pushViewController(escolha, animated: true)
    }
    
    func initialSetup(){
        self.loginLabel.roundBorder()
        self.loginLabel.setTitle(Labels.shared.login, for: .normal)
        self.loginLabel.applyShadow()
        self.userTextField.borderStyle = .roundedRect
        self.passwordTextFild.borderStyle = .roundedRect
    }

}

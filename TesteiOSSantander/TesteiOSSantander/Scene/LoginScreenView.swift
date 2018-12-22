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
        self.userTextField.delegate = self
        self.passwordTextFild.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
    
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if passwordisValid && userisValid{
            NetworkManager.shared.formtLogin(user: userTextField.text!, password: passwordTextFild.text!)
            NetworkManager.shared.request_User {
                DAKeychain.shared.save(self.passwordTextFild.text!, forKey: self.userTextField.text!)
                print("Mostrar",DAKeychain.shared.load(withKey: self.userTextField.text!))
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
        
        self.passwordTextFild.text = ""
        self.userTextField.text = ""
        self.loginLabel.roundBorder()
        self.loginLabel.setTitle(Labels.shared.login, for: .normal)
        self.loginLabel.applyShadow()
        self.userTextField.borderStyle = .roundedRect
        self.passwordTextFild.borderStyle = .roundedRect
    }
    
   
}

extension LoginScreenView: UITextFieldDelegate{
     func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.userTextField.resignFirstResponder()
        self.passwordTextFild.resignFirstResponder()
        self.view.endEditing(true)
    }
    
}

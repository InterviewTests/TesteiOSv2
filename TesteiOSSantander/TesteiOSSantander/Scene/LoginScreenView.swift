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
    var userData: [LocalUser]!
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
    
    @IBAction func login(_ sender: Any) {
        if validateLoginData(){
            NetworkManager.shared.formtLogin(user: userTextField.text!, password: passwordTextFild.text!)
            NetworkManager.shared.request_User {
                  self.saveData()
                  self.navergar()
            }
        }else{
            self.present(FeedBack.shared.feedbackError(), animated: true, completion: nil)
        }
    }
    
    func validateLoginData()->Bool{
        if Util.getFunctions.verifyPassword(Password: passwordTextFild.text!) &&  Util.getFunctions.isValidUser(user: userTextField.text!){
            return true
        }
        return false
    }
    func navergar() {
        let escolha = self.storyboard?.instantiateViewController(withIdentifier: "accountDetails") as! AccountScreenView
        self.navigationController?.pushViewController(escolha, animated: true)
    }
    
    func initialSetup(){
        self.userData = UserStore.singgleton.getUser()
        self.passwordTextFild.text = ""
        self.userTextField.text = ""
        self.loginLabel.roundBorder()
        self.loginLabel.setTitle(Labels.shared.login, for: .normal)
        self.loginLabel.applyShadow()
        self.userTextField.borderStyle = .roundedRect
        self.passwordTextFild.borderStyle = .roundedRect
        self.loadUser()
    }
    
    func saveData(){
        var user = self.userTextField.text
        if Util.getFunctions.checkIfCPF(user: userTextField.text!){
            user = self.userTextField.text!.removeChacter()
        }
        UserStore.singgleton.deleteAllData()
        DAKeychain.shared.save(self.passwordTextFild.text!, forKey: user!)
        UserStore.singgleton.salvar(user: user!)
    }
    func loadUser(){
        if userData != []{
             self.userTextField.text = userData[0].username!
             self.passwordTextFild.text = DAKeychain.shared.load(withKey: userData[0].username!)
        }
    }
   
}

extension LoginScreenView: UITextFieldDelegate{
     func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.userTextField.resignFirstResponder()
        self.passwordTextFild.resignFirstResponder()
        self.view.endEditing(true)
    }
    
}

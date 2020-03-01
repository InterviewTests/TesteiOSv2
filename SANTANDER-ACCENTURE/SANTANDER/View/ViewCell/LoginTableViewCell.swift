//
//  LoginTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

protocol PerformLoginDelegate: class {
    func loginBtnTapped(name: String, passwd:String)
}

protocol SomeUIViewDelegate {
    func segueFunction() 
}

class LoginTableViewCell: UITableViewCell {

    var loginTela: LoginViewController?
    
    var delegateSegue: SomeUIViewDelegate?
    
    @IBOutlet weak var logoBancoImageView: UIImageView!
    
    @IBOutlet weak var nomeUsuarioTextField: UITextField!{
        didSet{
            nomeUsuarioTextField.placeholder = "User"
            nomeUsuarioTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        }
    }

    
    @IBOutlet weak var senhaUsuarioTextField: UITextField!{
        didSet{
            senhaUsuarioTextField.placeholder = "Password"
            senhaUsuarioTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        }
    }
    
    
    @IBOutlet weak var loginButton: UIButton!{
    didSet{
        loginButton.backgroundColor = UIColor(red: 59/255, green: 73/255, blue: 238/255, alpha: 1)
        loginButton.layer.shadowColor = loginButton.backgroundColor?.cgColor
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
              
    }
    
    }
    weak var delegate: PerformLoginDelegate?
       var userValid = false
       var pswdValid = false

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nomeUsuarioTextField.delegate = self
        senhaUsuarioTextField.delegate = self
        nomeUsuarioTextField.text = "25200886805"
        senhaUsuarioTextField.text = "Cd@2"

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
   
    @IBAction func loginButton(_ sender: Any) {
       
        
        
        guard let user = nomeUsuarioTextField.text , let password = senhaUsuarioTextField.text else {
            return
        }
        let areValidFields = verifyIfValidFields()
        if areValidFields {
            delegate?.loginBtnTapped(name: user, passwd: password)
        } else {
            nomeUsuarioTextField.layer.borderColor = UIColor.red.cgColor
            senhaUsuarioTextField.layer.borderColor = UIColor.red.cgColor
        }
       
        self.delegateSegue?.segueFunction()
        
    }
    
   
    
    func verifyIfValidFields() -> Bool {
           guard let user = nomeUsuarioTextField.text , let password = senhaUsuarioTextField.text else {
            
               return false
           }
        if (String.validarEmail(email: user) || String.validarCPf(cpf: user))
            &&
            String.validarPassword(password) {
                   return true
               }
               return false
           }
    
    func setupDefaultValuesOnDismiss(){
           userValid = true
           pswdValid = false
           nomeUsuarioTextField.placeholder = "User"
           senhaUsuarioTextField.placeholder = "Password"
           senhaUsuarioTextField.text = ""
           loginButton.isEnabled = false
           loginButton.alpha = 0.5
       }
}



extension LoginTableViewCell: UITextFieldDelegate{
   
    @objc func textFieldDidChange(textField: UITextField) {
        guard let texto = textField.text else { return }
        
        if textField == nomeUsuarioTextField {
            if String.validarCPf(cpf: texto) || String.validarEmail(email: texto) {
                nomeUsuarioTextField.layer.borderColor = UIColor.lightGray.cgColor
                userValid = true
            } else {
                nomeUsuarioTextField.layer.borderColor = UIColor.red.cgColor
                userValid = false
            }
        }
        if textField == senhaUsuarioTextField {
            if String.validarPassword(texto){
               senhaUsuarioTextField.layer.borderColor = UIColor.lightGray.cgColor
                pswdValid = true
            } else {
                senhaUsuarioTextField.layer.borderColor = UIColor.red.cgColor
                pswdValid = false
            }
        }
        
        if userValid && pswdValid {
            loginButton.alpha = 1.0
            loginButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nomeUsuarioTextField {
            senhaUsuarioTextField.becomeFirstResponder()
            return false
        }
        if textField == senhaUsuarioTextField{
            senhaUsuarioTextField.resignFirstResponder()
            return true
        }
        return true
    }
    
    
}


 
    


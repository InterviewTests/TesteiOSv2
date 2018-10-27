//
//  LoginCell.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import UIKit

protocol PerformLoginDelegate: class {
    func loginBtnTapped(name: String, passwd:String)
}

class LoginCell: UITableViewCell {

    //poderia ter separado em mais cells, mas como nao estou muito
    //acostumada com essa arquitetura vou deixar tudo na mesma cell

    @IBOutlet weak var userTextField: TextField!{
        didSet{
            userTextField.placeholder = "User"
            userTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var passwordTextField: TextField!{
        didSet{
            passwordTextField.placeholder = "Password"
            passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var loginBtn: UIButton!{
        didSet{
            loginBtn.backgroundColor = UIColor(red: 59/255, green: 73/255, blue: 238/255, alpha: 1)
            loginBtn.layer.shadowColor = loginBtn.backgroundColor?.cgColor
            loginBtn.isEnabled = false
            loginBtn.alpha = 0.5
        }
    }
    
    weak var delegate: PerformLoginDelegate?
    var userValid = false
    var pswdValid = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        guard let user = userTextField.text , let password = passwordTextField.text else {
            return
        }
        
        if (String.isValidEmail(email: user) || String.isValidCPF(cpf: user)) &&
            String.isValidPassword(pswd: password) {
            delegate?.loginBtnTapped(name: user, passwd: password)
        } else {
            userTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
}

extension LoginCell: UITextFieldDelegate{
    @objc func textFieldDidChange(textField: UITextField) {
        guard let texto = textField.text else { return }
        
        if textField == userTextField {
            if String.isValidCPF(cpf: texto) || String.isValidEmail(email: texto){
                userTextField.layer.borderColor = UIColor.lightGray.cgColor
                userValid = true
            } else {
                userTextField.layer.borderColor = UIColor.red.cgColor
                userValid = false
            }
        }
        if textField == passwordTextField {
            if String.isValidPassword(pswd: texto){
                passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
                pswdValid = true
            } else {
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                pswdValid = false
            }
        }
        
        if userValid && pswdValid {
            loginBtn.alpha = 1.0
            loginBtn.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
            return false
        }
        if textField == passwordTextField{
            passwordTextField.resignFirstResponder()
            return true
        }
        return true
    }
}

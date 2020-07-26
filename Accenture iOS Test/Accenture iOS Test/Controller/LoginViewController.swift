//
//  ViewController.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 25/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var fieldChecker = FieldChecker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Outlets formatting
        txtUser = roundAndAddShadow(view: txtUser, color: #colorLiteral(red: 0.7154890895, green: 0.758533895, blue: 0.8112761974, alpha: 1), shadow: false) as? UITextField
        txtPassword = roundAndAddShadow(view: txtPassword, color: #colorLiteral(red: 0.7154890895, green: 0.758533895, blue: 0.8112761974, alpha: 1), shadow: false) as? UITextField
        btnLogin = roundAndAddShadow(view: btnLogin, color: #colorLiteral(red: 0.2974309027, green: 0.3922638893, blue: 0.9480091929, alpha: 1), shadow: true) as? UIButton

        
        // Outlets behavior
        txtUser.delegate = self
        txtPassword.delegate = self
    }
    
    // MARK: - IBActions

    @IBAction func clickLogin(_ sender: UIButton) {
        
        if !(fieldChecker.isCPFValidated || fieldChecker.isEmailValidated) {
            txtUser.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        if !(fieldChecker.isPasswordValidated){
            txtPassword.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        if(fieldChecker.isAllFieldsValidated()){
            self.performSegue(withIdentifier: "main", sender: self)
        }
    }
    
    // MARK: - TextField
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if(textField.text != nil){
            var isValidated:Bool = false
            
            if(textField == txtUser){
                fieldChecker.validateCPF(textField.text!)
                fieldChecker.validateEmail(textField.text!)
                if(fieldChecker.isCPFValidated || fieldChecker.isEmailValidated){
                    isValidated = true
                }
            }else{
                fieldChecker.validatePasssword(textField.text!)
                if(fieldChecker.isPasswordValidated){
                    isValidated = true
                }
            }
            
            if(isValidated){
                textField.textColor = #colorLiteral(red: 0.231372549, green: 0.2862745098, blue: 0.9333333333, alpha: 1)
            } else {
                textField.textColor = #colorLiteral(red: 0.2823529412, green: 0.3294117647, blue: 0.3960784314, alpha: 1)
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtUser {
            txtPassword.becomeFirstResponder()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func roundAndAddShadow(view: UIView, color: UIColor, shadow: Bool) -> UIView{
        
        view.layer.cornerRadius = 4.0
        
        if shadow {
            view.layer.shadowColor = color.cgColor
            view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            view.layer.shadowOpacity = 0.3
            view.layer.shadowRadius = 6.0
            view.layer.masksToBounds = false
        }
        
        if view .isKind(of: UITextField.self) {
            let textField = view as! UITextField
            textField.borderStyle = UITextField.BorderStyle.roundedRect
        }
        
        return view
        
    }
    
    // MARK: - Segue Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "main":
                _ = segue.destination as! MainViewController
            default: break
        }
    }
    
}


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Outlets formatting
        addBorderAndShadow(view: txtUser, color: #colorLiteral(red: 0.7154890895, green: 0.758533895, blue: 0.8112761974, alpha: 1), shadow: false)
        addBorderAndShadow(view: txtPassword, color: #colorLiteral(red: 0.7154890895, green: 0.758533895, blue: 0.8112761974, alpha: 1), shadow: false)
        addBorderAndShadow(view: btnLogin, color: #colorLiteral(red: 0.2974309027, green: 0.3922638893, blue: 0.9480091929, alpha: 1), shadow: true)

        
        // Outlets behavior
        txtUser.delegate = self
        txtPassword.delegate = self
    }
    
    // MARK: - IBActions

    @IBAction func clickLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "main", sender: self)
    }
    
    // MARK: - TextField
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtUser {
            txtPassword.becomeFirstResponder()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addBorderAndShadow(view: UIView, color: UIColor, shadow: Bool){
        
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


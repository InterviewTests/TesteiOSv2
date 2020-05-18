//
//  ViewController.swift
//  santander-interview
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var loginBrainModel = LoginBrainModel()
    var homeBrainModel = HomeBrainModel()
    var userDetails : UserModel?
    
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var logoImage: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldUser.delegate = self
        textFieldPassword.delegate = self
        
        logoImage.layer.cornerRadius = 7
        logoImage.layer.masksToBounds = true
        
        buttonLogin.layer.shadowColor = UIColor.lightGray.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width: 3, height: 3)
        buttonLogin.layer.shadowRadius = 4
        buttonLogin.layer.cornerRadius = 4
        buttonLogin.layer.shadowOpacity = 0.6
        
    }
    
    @IBAction func buttonLoginPressed(_ sender: UIButton) {
        let status = loginBrainModel.isValidLogin(textFieldUser.text, textFieldPassword.text)
        if(!status) {
            let alert = UIAlertController(title: "Login Inválido", message: "Usuário deve ser email ou cpf e a senha deve conter ao menos um numero, uma letra maiúscula e um símbolo.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        loginBrainModel.requestLogin(completionSuccess: { (response) in
            self.userDetails = response
            self.performSegue(withIdentifier: "goToHome", sender: self)
            return
        }, completionError: { (error) in
            print(error)
            return
        })
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let destinationVC = segue.destination as! HomeViewController
            destinationVC.userModel = userDetails
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldUser.endEditing(true)
        textFieldPassword.endEditing(true)
        return true
    }
    
    
}


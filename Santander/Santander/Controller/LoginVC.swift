//
//  ViewController.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 08/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let parameters = [
            "user": "test_user",
            "password": "Test@1"
        ]
        
        AF.request("https://bank-app-test.herokuapp.com/api/login", method: .post, parameters: parameters, encoding:  URLEncoding.httpBody).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case.success(let data):
                print("success",data)
            case.failure(let error):
                print("Not Success",error)
            }
            
        }

    }//DidLoad

    @IBAction func loginPressed(_ sender: Any) {
        guard let user = usernameTxt.text, usernameTxt.text?.characters.count != 0  else {
            print("Please enter your email")
            return
        }
        
        guard let pass = passwordTxt.text, passwordTxt.text?.characters.count != 0  else {
            print("Please enter your password")
            return
        }
        
        if isValidPassword(passID: pass) == false {
            let alert = UIAlertController(title: "Verificar campo password", message: "A senha deve possuir letra maiuscula, um caracter especial e um caracter alfanumérico", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }else{
            print(user, pass)
            
            AuthService.instance.loginUser(user: user, pass: pass, completion: { (success) in
                if success {
                    print("logged in user!", AuthService.instance.userName)
                    
                self.performSegue(withIdentifier: TO_CURRENCY, sender: nil)
                }
            })
            
        }//else
        
        
    }//loginpressed
    
    func isValidPassword(passID:String) -> Bool {
        print(passID)
        let passRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{1,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        print(passwordTest.evaluate(with: passID))
        return passwordTest.evaluate(with: passID)
    }
    
}


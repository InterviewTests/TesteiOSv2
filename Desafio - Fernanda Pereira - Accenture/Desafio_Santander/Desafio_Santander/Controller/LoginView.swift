//
//  ViewController.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 05/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import UIKit


class LoginView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lblUser: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        let user = lblUser.text!
        let password = lblPassword.text!
        
        if verificarCampos(user: user, password: password){
            login(user: user, password: password)}
        else{
            print("Erro ao validar")
        }
    }
    
    func verificarCampos(user: String, password:String) -> Bool{
        if user.isEmpty{
            return false
        }
        if password.isEmpty{
            return false
        }
        return true
    }
    
    let serviceRequest: LoginService = requestLogin()
    
    func goToDetails(user: Usuario){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = mainStoryboard.instantiateViewController(withIdentifier: "UserDetails") as? UserDetails{
            controller.userDetails = user
            
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func login(user: String, password: String){
        serviceRequest.login(user: user, password: password){ user in
            self.goToDetails(user: user)
            
            
        }
    }
    
    
}


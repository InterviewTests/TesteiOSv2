//
//  ViewController.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/13/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit

class TelaLoginViewController: UIViewController {
    
    @IBOutlet weak var tfuser: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    
    let service: LoginApi = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    
    func validar(user: String, password: String) -> Bool {
        if user.isEmpty || password.isEmpty{
            return false
        }
        return true
    }
    

    func login(user: String, senha: String) {
        service.login(user: user, password: senha) {
            user in
            self.navegarTelaDetalhes(user: user)
        }
    }
    
    
    func navegarTelaDetalhes(user: Cliente) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier:
            "DetalhesViewController") as? DetalhesViewController {    
    
            controller.cliente = user
            
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
    }
    
    @IBAction func btnLogin(sender: UIButton) {
        let usuario = tfuser.text!
        let senha = tfpassword.text!
        
        
        
        if validar(user: usuario, password: senha) {
            login(user: usuario, senha: senha)
        } else {
            print("Error")
        }
    }
}
    




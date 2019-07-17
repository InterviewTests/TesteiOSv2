//
//  ViewController.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/13/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator

class TelaLoginViewController: UIViewController {
    
    @IBOutlet weak var tfuser: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    
    let service: LoginApi = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    func senha (password: String) -> Bool {
        let character: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%^&*()_-+=~`|]}[{':;?/<>.,")
        let letter: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let number: NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        
        if (password.rangeOfCharacter(from: character as CharacterSet) != nil) && (password.rangeOfCharacter(from: letter  as CharacterSet) != nil) && (password.rangeOfCharacter(from: number as CharacterSet) != nil) {
            return true
        }
        return false
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
        
        if self.checkUser(user: usuario) {
            if self.senha(password: senha) {
                login(user: usuario, senha: senha)
            } else {
                print("Senha incorreta")
            }
        } else {
            print("User incorreto")
        }
    }
    func checkCpf (user: String) -> Bool {
        let valido = BooleanValidator().validate(cpf: user)
        if valido {
            return true
        }
        return false
    }
    
    func checkEmail (user: String) -> Bool {
        let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return emailPredicate.evaluate(with: user)
    }
    
    func checkUser(user: String) -> Bool {
        if(checkCpf(user: user)) {
          return true
        } else if (checkEmail(user: user)) {
            return true
        } else {
            return false
        }
    }
}
    




//
//  ViewController.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 05/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator


class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    @IBOutlet weak var lblErro: UILabel!
    
    let service: LoginService = BancoAPI()
    
    func validaEmail (user: String) -> Bool{
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: user)

    }
    func validaCPF(user:String) -> Bool{
       let success = BooleanValidator().validate(cpf: user)
        if success {
            return true
        }
        return false
    }
    
    func ValidaUser(user: String) -> Bool {
        if (validaCPF(user: user)){
            return true
        }
        if (validaEmail(user: user)){
            return true
        }
        
        return false
    }
    func ValidaSenha(senha:String) ->Bool {
       
        let num:NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        let letraMai: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let especial: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_-+=˜`|]}[{':;?/<>.,")
        
        if ((senha.rangeOfCharacter(from: num as CharacterSet) != nil) && (senha.rangeOfCharacter(from: letraMai as CharacterSet) != nil) && (senha.rangeOfCharacter(from: especial as CharacterSet) != nil)) {
            return true
    }
        
        return false
   
    }
    func navegaDados(user: Usuario){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DadosViewController") as? DadosViewController {
            
            controller.usuario = user
            
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    func login(user: String, senha: String){
        service.login(user: user, password: senha) { user in
            self.navegaDados(user: user)
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let user = txtUser.text!
        let senha = txtSenha.text!
        
        if(ValidaUser(user: user)){
            if(ValidaSenha(senha: senha)){
                login(user: user, senha: senha)
            }
            else{
                lblErro.text = "Senha inválida"
            }
        }else{
            lblErro.text = "Usuário inválido"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}


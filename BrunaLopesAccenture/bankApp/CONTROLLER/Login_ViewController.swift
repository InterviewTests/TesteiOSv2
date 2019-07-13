//
//  ViewController.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 05/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator

class Login_ViewController: UIViewController {

    let service: LoginService = ConexaAPI()
    
    @IBOutlet weak var outUser: UITextField!
    @IBOutlet weak var outPassword: UITextField!
    
    @IBAction func actLogin(_ sender: UIButton) {
        
        let usuario = outUser.text!
        let senha = outPassword.text!
        
        if validaLogin(user: usuario, senha: senha) {
            login(user: usuario, senha: senha)
        } else {
            let popUp = "Verificar e-mail/CPF digitados"
            let titulo = "Atenção!"
            let alert = UIAlertController(title: titulo, message: popUp, preferredStyle: .alert)
            let botao = "Ok"
            let action = UIAlertAction(title: botao, style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func validaLogin(user: String, senha: String) -> Bool {
        
        if user.isEmpty || senha.isEmpty{
            return false
        } else if validaEmail(teste: user) || validaCPF(teste: user){
            if validaSenha(senha: senha){
                return true
            }
        }
        return false
    }
    
    func login(user: String, senha: String){
        service.login(user: user, password: senha) { user in
            self.vaiParaDetalhes(user: user)
        }
    }
    
    func validaEmail(teste: String) -> Bool{
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailteste = NSPredicate(format: "SELF MATCHES %@", email)
        
        return emailteste.evaluate(with: teste)
    }
    
    func validaCPF(teste: String) -> Bool{
        
        let sucesso = BooleanValidator().validate(cpf: teste)
        return sucesso
    }
    
    func validaSenha(senha: String) -> Bool {
        
        let numero: NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        let maiuscula: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let caractEspeciais: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_+{}|\"':;,./<>?˜")
        
        if ((senha.rangeOfCharacter(from: numero as CharacterSet) != nil) && (senha.rangeOfCharacter(from: maiuscula as CharacterSet) != nil) && (senha.rangeOfCharacter(from: caractEspeciais as CharacterSet) != nil)) {
            return true
        }
        return false
    }
    
    func vaiParaDetalhes(user: Usuario){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "Detalhes_ViewController")
            as? Detalhes_ViewController {
            controller.usuario = user
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


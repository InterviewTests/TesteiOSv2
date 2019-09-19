//
//  LoginViewController.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright (c) 2019 Marcus Titton. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
    func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    
    @IBOutlet weak var txt_user: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
  
    private func setup()
    {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
  
    // MARK: Do something
  
    //@IBOutlet weak var nameTextField: UITextField!
  
    func doSomething()
    {
        let request = Login.Something.Request()
        interactor?.doSomething(request: request)
    }
  
    func displaySomething(viewModel: Login.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        showDetailViewController(alert, sender: nil)
    }
    
    //Ação do Botão LOGIN
    @IBAction func btnLogin(_ sender: Any)
    {
        let login = txt_user.text!
        let password = txt_password.text!
        
        //Verifica se os campos foram digitados
        if login.isEmpty || password.isEmpty
        {
            //Camnpo de login e senha vazios, exibe mensagem para o usuario
            showAlert(message: "Os campos não podem ser vazios")
            return
        }
        
        //Verifica se o campo de login é e-mail
        if !(login.contains("@") && login.contains("."))
        {
            //Não é e-mail, verifica se é CPF
            var cpf = login.replacingOccurrences(of: ".", with: "")
            cpf = cpf.replacingOccurrences(of: "-", with: "")
            
            if !(cpf.isNumber() && cpf.count == 11)
            {
                //Não é CPF também, exibe mensagem para usuário
                showAlert(message: "E-mail ou CPF inválido, favor tentar novamente.")
                return
            }
        }
        
        //Faz a validação da senha
        if !password.validaSenha()
        {
            //A senha não está no padrão. Exibe mensagem para o usuário
            showAlert(message: "A senha deve conter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico.")
            return
        }
        
        //Faz a chamada para a API
        //let request = Login.RequestUser.Request(user: login, password: password)
        //LoginInteractor.
        
        print("Campo válido")
    }
}

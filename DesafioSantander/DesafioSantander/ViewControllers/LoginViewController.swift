//
//  LoginViewController.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func showAlert(_ message: String)
    func logged(_ account: UserAccount)
}

class LoginViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var interactor: LoginInteractor?
    
    // MARK: - View Controller life cycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        gestureRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(gestureRecognizer)
        
        configureView()
    }
    
    // MARK: - Privates
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    private func configureView() {
        corner(in: loginButton, radius: 5)
    }
    
    // MARK: - Selectors
    
    @objc private func closeKeyboard() {
        userText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }

    // MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
        let user = userText.text
        let password = passwordText.text

        guard let interactor = self.interactor else { return }
        
        guard interactor.validateUsername(user) else {
            showAlert("Usuário deve ser e-mail ou CPF")
            return
        }
        
        guard interactor.validatePassword(password) else {
            showAlert("A senha deve conter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico")
            return
        }
        
        interactor.login(user!, password!)
    }

}

// MARK: - Extensions

extension LoginViewController: LoginDisplayLogic {
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func logged(_ account: UserAccount) {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "accountViewController") as? AccountViewController
        controller?.account = account
        
        DispatchQueue.main.async {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.window?.rootViewController = controller
        }
    }
}

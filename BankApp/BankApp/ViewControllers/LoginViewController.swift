//
//  LoginViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import UIKit
import Alamofire


class LoginViewController: UIViewController {
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var resultRequest: FetchableData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        if let lastUserLogged = UserDefaults.standard.string(forKey: IDENTIFIERS.STORAGE.LAST_USERNAME_LOGGED) {
            userText.text = lastUserLogged
        } else {
            userText.text = CONSTANTS.BLANK
        }
        
        passwordText.text = CONSTANTS.BLANK
    }
        
    @IBAction func loginButtonPressed(_ sender: UIButton) {        
        if let alert = AlertFactory.createAlertBasedOnContentsOf(userText: userText?.text,
                                                                 passwordText: passwordText?.text) {
            self.present(alert, animated: true, completion: nil)
        } else {
            let user = userText.text
            UserDefaults.standard.set(user, forKey: IDENTIFIERS.STORAGE.LAST_USERNAME_LOGGED)
            
            self.fetchUserWith(username: self.userText.text!, password: self.passwordText.text!) { result in DispatchQueue.main.async {
                    self.resultRequest = result
                }
            }
            
            if let userAccount = self.resultRequest as? UserAccount {
                self.performSegue(withIdentifier: IDENTIFIERS.STORYBOARD.SEGUE_NAME, sender: userAccount)
            } else if let errorMessage = self.resultRequest as? ErrorMessage {
                let userInvalidAlert = AlertFactory.createAlert(withMessage: errorMessage.message, andCode: errorMessage.code)
                
                self.present(userInvalidAlert, animated: true, completion: nil)
            }
        }
    }
        
    // TODO: Arrumar esse codigo, tem que apertar 0942134821905912812 vezes o botao para chamar a pagina
    private func fetchUserWith(username: String, password: String, completion: @escaping (FetchableData) -> Void) {
        let request = AF.request(REQUESTS.LOGIN_ENDPOINT,
                                 method: .post,
                                 parameters: UserLoginCredentialsParameters(user: username, password: password),
                                 encoder: JSONParameterEncoder.default,
                                 headers: REQUESTS.HEADERS)
                
            request.responseDecodable(of: UserLoginData.self) { response in
                if let userLogin = response.value {
                    if (userLogin.error?.code) != nil {
                        let error = ErrorMessage(from: userLogin.error!)
                        completion(error)
                    } else if (userLogin.userAccount?.name) != nil {
                        let userAccount = UserAccount(from: userLogin.userAccount!)
                        completion(userAccount)
                    }
                }
            }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userAccount = sender as? UserAccount {
            if let userCurrencyViewController = segue.destination as? UserCurrencyViewController {
                userCurrencyViewController.userAccount = userAccount
            }
        }
    }
}

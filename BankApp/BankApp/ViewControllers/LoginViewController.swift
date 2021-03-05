//
//  ViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var resultRequest: FetchedData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userText.text = ""
        passwordText.text = ""
    }
        
    @IBAction func loginButtonPressed(_ sender: UIButton) {        
        if let alert = AlertFactory.createAlertBasedOnContentsOf(userText: userText?.text,
                                                                 passwordText: passwordText?.text) {
            self.present(alert, animated: true, completion: nil)
        } else {
            self.fetchUserWith(username: self.userText.text!, password: self.passwordText.text!) { result in
                //self.createSpinnerView()
                
                self.resultRequest = result
            }
            
            if let userAccount = self.resultRequest as? UserAccount {
                self.performSegue(withIdentifier: IDENTIFIERS.SEGUE_NAME, sender: userAccount)
            } else if let errorMessage = self.resultRequest as? ErrorMessage {
                let userInvalidAlert = AlertFactory.createAlertOfUserInvalid(withMessage: errorMessage.message, andCode: errorMessage.code)
                
                self.present(userInvalidAlert, animated: true, completion: nil)
            }
        }
    }
    
    private func fetchUserWith(username: String, password: String, completion: @escaping (FetchedData) -> Void) {
        let request = AF.request(REQUESTS.LOGIN_ENDPOINT,
                                 method: .post,
                                 parameters: UserLoginCredentialsParameters(user: username, password: password),
                                 encoder: JSONParameterEncoder.default,
                                 headers: REQUESTS.HEADERS)
                
            request.responseDecodable(of: UserLoginData.self) { response in
                if let userLogin = response.value {
                    if (userLogin.error?.code) != nil {
                        let error = ErrorMessage(from: userLogin.error!)
                        DispatchQueue.main.async {
                            completion(error)
                        }
                    } else if (userLogin.userAccount?.name) != nil {
                        let userAccount = UserAccount(from: userLogin.userAccount!)
                        DispatchQueue.main.async {
                            completion(userAccount)
                        }
                    }
                }
            }
    }
    
//    private func createSpinnerView() {
//        let child = SpinnerViewController()
//
//        addChild(child)
//        child.view.frame = view.frame
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            child.willMove(toParent: nil)
//            child.view.removeFromSuperview()
//            child.removeFromParent()
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userAccount = sender as? UserAccount {
            if let userCurrencyViewController = segue.destination as? UserCurrencyViewController {
                userCurrencyViewController.userAccount = userAccount
            }
        }
    }
}

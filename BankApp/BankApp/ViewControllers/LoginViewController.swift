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
    
    private var resultRequest: FetchableData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
                        
        self.dismissKey()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        self.initiateTextFields()
    }
            
    
    /// Instantiates the text fields: if there is an user saved locally, it will be on user's `textField`
    private func initiateTextFields() {
        if let lastUserLogged = UserDefaults.standard.string(forKey: IDENTIFIERS.STORAGE.LAST_USERNAME_LOGGED) {
            userText.text = lastUserLogged
        } else {
            userText.text = CONSTANTS.BLANK
        }
        passwordText.text = CONSTANTS.BLANK
    }
        
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let alert = AlertFactory.createAlertBasedOnContentsOf(userText: userText?.text, passwordText: passwordText?.text) {
            self.present(alert, animated: true, completion: nil)
        } else {
            self.persistLastUserLogged()
            self.doTryLoginWith(username: self.userText.text!, password: self.passwordText.text!)
                                    
            self.analyzeLoginResultAndPerformAction()
        }
    }
    
    /// Based on `resultRequest` variable, this method can: open the statement screen of the user; present an error alert with the message fetched in request.
    /// By the fact of the requests at all are normally asynchronous, the implementation of this method was embed into a Timer with 2 second delay.
    /// (it will be fixed soon).
    /// While the method is executed, one `ActivityView` is performed.
    private func analyzeLoginResultAndPerformAction() {
        let spinnerView = self.displaySpinner(onView: self.view)
        
        // FIXME: Figure out how create a spinner who remains active while the "result" is nil.
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            self.removeSpinner(spinner: spinnerView)
            if let userAccount = self.resultRequest as? UserAccount {
                self.performSegue(withIdentifier: IDENTIFIERS.STORYBOARD.SEGUE_NAME, sender: userAccount)
            } else if let errorMessage = self.resultRequest as? ErrorMessage {
                let userInvalidAlert = AlertFactory.createAlert(withMessage: errorMessage.message, andCode: errorMessage.code)
                self.present(userInvalidAlert, animated: true, completion: nil)
            }
        }
    }
    
    /// As the name suggests, if the loggin is successful, user's `name` is stored locally.
    private func persistLastUserLogged() {
        let user = userText.text
        UserDefaults.standard.set(user, forKey: IDENTIFIERS.STORAGE.LAST_USERNAME_LOGGED)
    }
            
    /// Try to make login with the arguments `username` and `password`, making a `POST` request and storing the result in `resultRequest`,
    /// as `UserAccount` or `ErrorMessage`
    /// - parameter username: the user name (an email or CPF valid)
    /// - parameter password: the password's username valid
    private func doTryLoginWith(username: String, password: String) {
        let request = AF.request(REQUESTS.LOGIN_ENDPOINT,
                                 method: .post,
                                 parameters: UserLoginCredentialsParameters(user: username, password: password),
                                 encoder: JSONParameterEncoder.default,
                                 headers: REQUESTS.HEADERS)
                                
        request.responseDecodable(of: UserLoginData.self) { response in            
            if let userLogin = response.value {
                if (userLogin.error?.code) != nil {
                    self.resultRequest = ErrorMessage(from: userLogin.error!)
                } else if (userLogin.userAccount?.name) != nil {
                    self.resultRequest = UserAccount(from: userLogin.userAccount!)
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

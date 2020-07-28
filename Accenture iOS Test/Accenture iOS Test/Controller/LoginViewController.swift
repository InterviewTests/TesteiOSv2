//
//  ViewController.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 25/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var userAccount: UserAccount!
    var fieldChecker = FieldChecker()
    var apiCaller = APICaller()
    var appDelegate: AppDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        // Keychain
        getSavedUser()
        fieldChecker.validateCPF(self.txtUser.text!)
        fieldChecker.validateEmail(self.txtUser.text!)
        fieldChecker.validatePasssword(self.txtPassword.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        
        // View Layout
        txtUser = UIView.LayoutRoundedWithShadow2(view: txtUser, color: App.Color.greyThemeLight, shadow: false) as? UITextField
        txtPassword = UIView.LayoutRoundedWithShadow2(view: txtPassword, color: App.Color.greyThemeLight, shadow: false) as? UITextField
        btnLogin = UIView.LayoutRoundedWithShadow2(view: btnLogin, color: App.Color.blueTheme, shadow: true) as? UIButton

        
        // Outlets behavior
        txtUser.delegate = self
        txtPassword.delegate = self
    }
    
    // MARK: - Delegates
    func getAccountInfoError(error: NSDictionary?){
        appDelegate.stopLoading()
        var alertMessage = "defaultBodyMessageError".localized
        if(error?["message"] != nil){
            alertMessage = error?["message"] as! String
        }
        let alert = UIAlertController(title: "defaultTitleMessage".localized, message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "defaultButtonMessage".localized, style: .default, handler: nil))

        self.present(alert, animated: true)
        
    }
    
    func getAccountInfoResponse(response: NSDictionary?){
        if(response != nil && response!.count > 0){
            // Saves return in struct
            self.userAccount = UserAccount(id: response!["userId"] as? NSNumber ?? 0, name: response!["name"] as? String ?? "", bankAccount: response!["agency"] as? String ?? "", agency: response!["bankAccount"] as? String ?? "", balance: response!["balance"] as? NSNumber ?? 0)
            self.performSegue(withIdentifier: "main", sender: self)
        } else {
            getAccountInfoError(error: nil);
        }
    }
    
    // MARK: - IBActions

    @IBAction func clickLogin(_ sender: UIButton) {
        
        if !(fieldChecker.isCPFValidated || fieldChecker.isEmailValidated) {
            txtUser.textColor = App.Color.redError
            txtUser.attributedPlaceholder = NSAttributedString(string: txtUser.placeholder!,
                                                               attributes: [NSAttributedString.Key.foregroundColor: App.Color.redPlaceholder])
        }
        
        if !(fieldChecker.isPasswordValidated){
            txtPassword.textColor = App.Color.redError
            txtPassword.attributedPlaceholder = NSAttributedString(string: txtPassword.placeholder!,
            attributes: [NSAttributedString.Key.foregroundColor: App.Color.redPlaceholder])
        }
        
        if(fieldChecker.isAllFieldsValidated()){
            appDelegate.startLoading()
            apiCaller.getAccountInfo(user: txtUser.text!, password: txtPassword.text!, delegate: self)
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        self.userAccount = nil
        self.txtUser.text = nil
        self.txtPassword.text = nil
        self.apiCaller = APICaller()
        self.fieldChecker = FieldChecker()
    }
    
    
    // MARK: - iOS Keychain
    
    func getSavedUser() {
        self.txtUser.text = KeychainWrapper.standard.string(forKey: "SavedUser") ?? ""
        self.txtPassword.text = KeychainWrapper.standard.string(forKey: "SavedPassword") ?? ""
    }
    
    func setSavedUser() {
        KeychainWrapper.standard.set(self.txtUser.text!, forKey: "SavedUser")
        KeychainWrapper.standard.set(self.txtPassword.text!, forKey: "SavedPassword")
    }
    
    // MARK: - TextField Delegate
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!,
                                                             attributes: [NSAttributedString.Key.foregroundColor: App.Color.grayPlaceholder])
        if(textField.text != nil){
            var isValidated:Bool = false
            
            if(textField == txtUser){
                fieldChecker.validateCPF(textField.text!)
                fieldChecker.validateEmail(textField.text!)
                if(fieldChecker.isCPFValidated){
                    textField.text = textField.text!.filter("0123456789".contains)
                    isValidated = true
                } else if (fieldChecker.isEmailValidated){
                    isValidated = true
                }
            }else{
                fieldChecker.validatePasssword(textField.text!)
                if(fieldChecker.isPasswordValidated){
                    isValidated = true
                }
            }
            
            if(isValidated){
                textField.textColor = App.Color.blueTheme
            } else {
                textField.textColor = App.Color.greyTheme
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtUser {
            txtPassword.becomeFirstResponder()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Segue Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "main":
                
                // Keychain
                setSavedUser()
                
                appDelegate.stopLoading()
                let mainViewController = segue.destination as! MainViewController
                mainViewController.userAccount = self.userAccount
                
            default: break
        }
    }
    
}


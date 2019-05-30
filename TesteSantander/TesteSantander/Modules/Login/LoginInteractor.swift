//
//  LoginInteractor.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright (c) 2019 Felipe Alexander Silva Melo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic {
    func login(request: Login.Login.Request)
}

protocol LoginDataStore {
    var user: User? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var user: User?
    
    // MARK: Do something
    
    func login(request: Login.Login.Request) {
        let userFormFields = request.userFormFields
        if let errorMessage = validateForm(userFormFields: userFormFields) {
            presenter?.displayErrorMessage(message: errorMessage)
            return
        }
        
        worker = LoginWorker()
        worker?.login(userFormFields: request.userFormFields) { user in
            self.user = user
            if let errorMessage = user.error.message {
                self.presenter?.displayErrorMessage(message: errorMessage)
            } else {
                let response = Login.Login.Response(user: user)
                self.presenter?.presentStatements(response: response)
            }
        }
    }
    
    fileprivate func validateForm(userFormFields: Login.UserFormFields) -> String? {
        var message: String?
        message = validateUsername(username: userFormFields.user)
        guard message == nil else { return message }
        return validatePassword(password: userFormFields.password)
    }
    
    fileprivate func validateUsername(username: String) -> String? {
        return username.isCPF || username.isEmail ? nil : Constants.Errors.invalidUsername
    }
    
    fileprivate func validatePassword(password: String) -> String? {
        var hasUppercasedLetter = false
        var hasDigit = false
        var hasSpecialCharacter = false
        password.forEach { (character) in
            hasUppercasedLetter = !hasUppercasedLetter ? character.isUppercase : hasUppercasedLetter
            hasDigit = !hasDigit ? character.isNumber : hasDigit
            hasSpecialCharacter = !hasSpecialCharacter ? character.isNumber : hasSpecialCharacter
        }
        
        return hasUppercasedLetter && hasUppercasedLetter && hasDigit ? nil : Constants.Errors.invalidPassword
    }
}

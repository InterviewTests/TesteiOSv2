//
//  LoginInteractor.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginBusinessLogic: class {
    func applyBusinessLogic(request: Login.Login.Request)
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic!
    var fieldsValidationWorker: LoginFieldsValidationWorker!
    var httpRequestWorker: LoginHTTPRequestWorker!
            
    /// Apply some business login in the fields (a.k.a. `username` and `password`) inside the `request` object.
    /// - Parameter request: a `request` object populated by `viewController`
    func applyBusinessLogic(request: Login.Login.Request) {
        let user = User(username: request.fields.username,
                        password: request.fields.password)
                
        let isUserValidBasedOnFields = self.validateFields(of: user)
        
        if isUserValidBasedOnFields {
            httpRequestWorker = LoginHTTPRequestWorker()
            httpRequestWorker.doLogin(with: user) { data in
                DispatchQueue.main.async {
                                        
                    var userAccount: UserAccount?
                    var errorMessage: ErrorMessage?
                    
                    if let _ = data.userAccount.userId {
                        userAccount = UserAccount(extractedFrom: data)
                    }
                    if let _ = data.error.code {
                        errorMessage = ErrorMessage(extractedFrom: data)
                    }
                    
                    let response = Login.Login.Response(user: userAccount, error: errorMessage)
                    self.presenter.presentLoginResponse(response: response)
                }
            }
        } else {
            print("eita")
            self.presenter.presentLoginResponse(response: Constants.USER_OR_PASSWORD_INVALID_RESPONSE)            
        }
    }
    
    
    /// Delegates the validation for the `LoginFieldsValidationWorker` object.
    /// - Parameter user: the `User` object which has `username` and `password` properties.
    /// - Returns: `true` if the fields satisfies the preconditions; false if `username`, `password` or both does not satisfy the preconditions.
    private func validateFields(of user: User) -> Bool {
        fieldsValidationWorker = LoginFieldsValidationWorker()
        return fieldsValidationWorker.validate(user: user)
    }
}

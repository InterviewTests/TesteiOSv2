//
//  LoginPresenter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol LoginPresentationLogic {
    func didFetchLoginResponse()
    func invalidEmailRequest()
    func invalidpasswordRequest()
    func didFetchError(_ errorMessage: String)
}

class LoginPresenter: LoginPresentationLogic {
    
    private unowned var viewController: LoginDisplayLogic
    
    init(viewController: LoginDisplayLogic) {
        self.viewController = viewController
    }
    
    func didFetchLoginResponse() {
        viewController.routeToPayments()
    }
    
    func invalidEmailRequest() {
        viewController.displayLoginError(message: Login.Constants.Errors.invalidEmail)
    }
    
    func invalidpasswordRequest() {
        viewController.displayLoginError(message: Login.Constants.Errors.invalidpassword)
    }
    
    func didFetchError(_ errorMessage: String) {
        viewController.displayErrorAlert(message: errorMessage)
    }
}

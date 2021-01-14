//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func didFailToValidate(_ message: String)
    
    func startRequest()
    func finishRequest()
    
    func didLoginWithSuccess()
    func loginDidFail(_ errorMessage: String)
    
    func hasLoginSaved(_ loginSaved: Bool)
}

protocol LoginPresenterDelegate: AnyObject {
    func startRequesting()
    func finishRequesting()
    
    func showValidationError(_ errorMessage: String)
    func showLoginError(_ errorMessage: String)
    
    func cleanFields()
    
    func presentUserSavedLocally()
    func hideUserSavedLocally()
}


class LoginPresenter {
    weak var view: LoginPresenterDelegate?
    var router: LoginRouter?
}

extension LoginPresenter: LoginPresenterProtocol {
    func didFailToValidate(_ message: String) {
        view?.showValidationError(message)
    }
    
    func startRequest() {
        view?.startRequesting()
    }
    func finishRequest() {
        view?.finishRequesting()
    }
    
    func didLoginWithSuccess() {
        view?.cleanFields()
        router?.didLogin()
    }
    
    func loginDidFail(_ errorMessage: String) {
        view?.showLoginError(errorMessage)
    }
    
    func hasLoginSaved(_ loginSaved: Bool) {
        (loginSaved) ? view?.presentUserSavedLocally() : view?.hideUserSavedLocally()
    }
    
}

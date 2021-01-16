//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginPresenterDelegate?
    var router: LoginRouter?
    
    
}


// MARK: - Access from Interactor

extension LoginPresenter: LoginPresenterProtocol {
    
    
}

//
//  LoginRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginRouter {
    
    static func createModule(view: LoginViewController) {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
    }
    
    
}

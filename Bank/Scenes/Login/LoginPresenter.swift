//
//  LoginPresenter.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

protocol LoginPresentationLogic {
    func showErrorMessage(message: String)
    func routeShowStatement()
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func showErrorMessage(message: String) {
        viewController!.showErrorMessage(message: message)
    }
    
    func routeShowStatement() {
        viewController!.routeShowStatement()
    }
}

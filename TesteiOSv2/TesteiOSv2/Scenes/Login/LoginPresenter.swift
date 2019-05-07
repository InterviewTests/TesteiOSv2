//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Lucas Saito on 06/05/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

protocol LoginPresenterProcotol {
    func presentErrorMessage(message: String)
}

class LoginPresenter: LoginPresenterProcotol {
    weak var viewController: LoginViewControllerProtocol?
    
    func presentErrorMessage(message: String) {
        viewController?.displayErrorMessage(message: message)
    }
}

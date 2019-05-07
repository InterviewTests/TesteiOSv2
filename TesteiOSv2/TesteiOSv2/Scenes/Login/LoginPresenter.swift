//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Lucas Saito on 06/05/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

protocol LoginPresenterProcotol {
    func presentErrorMessage(response: LoginModel.Response)
}

class LoginPresenter: LoginPresenterProcotol {
    weak var viewController: LoginViewControllerProtocol?
    
    func presentErrorMessage(response: LoginModel.Response) {
        if let errorMessage = response.errorMessage {
            viewController?.displayErrorMessage(message: errorMessage)
        }
    }
}

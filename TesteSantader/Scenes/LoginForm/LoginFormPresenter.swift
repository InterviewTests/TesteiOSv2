//
//  LoginFormPresenter.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol LoginFormPresentationLogic {
    func presentLogin(response: LoginForm.Login.Response)
    func showExistentUser(userID: String, password: String)
}

class LoginFormPresenter: LoginFormPresentationLogic {
    
    weak var viewController: LoginFormDisplayLogic?
    
    func showExistentUser(userID: String, password: String) {
        viewController?.displayExistentUser(userID: userID, password: password)
    }
    
    // MARK: - Login
    
    func presentLogin(response: LoginForm.Login.Response) {
        
        let viewModel = LoginForm.Login.ViewModel(success: response.success)
        viewController?.displayLogin(viewModel: viewModel)
    }
    
}

//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentLoginErrorMessage(response: Login.Response)
    func presentLoginSuccesfull(response: Login.Response)
    func loadView()
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginPresenterOutput?
    
    func loadView() {
        viewController?.loadingView()
    }

    func presentLoginErrorMessage(response: Login.Response) {
        let viewModel = Login.ViewModelFailedLogin(message: response.message ?? "Error")
        viewController?.displayLoginErrorMessage(viewModel: viewModel)
    }
    
    func presentLoginSuccesfull(response: Login.Response) {
        guard response.user != nil else {
            let viewModel = Login.ViewModelFailedLogin(message: response.message ?? "Error")
            viewController?.displayLoginErrorMessage(viewModel: viewModel)
            return
        }
        
        let viewModel = Login.ViewModelSuccessfullLogin()
        viewController?.displaySuccessfullLogin(viewModel: viewModel)
    }
}

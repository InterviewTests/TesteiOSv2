//
//  LoginPresenter.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentTellStatements(response: Login.Response)
    func presentTellStatementsError(response: Login.Response)
    func presentGetUserData(request: Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presentTellStatementsError(response: Login.Response) {
        viewController?.displayStatementsError(viewModel: Login.ViewModel(error: response.error))
    }
    
    func presentTellStatements(response: Login.Response) {
        let viewModel = Login.ViewModel()
        viewController?.displayStatementsSuccess(viewModel: viewModel)
    }
    
    func presentGetUserData(request: Login.Response) {
        let viewModel = Login.ViewModel(user: request.user)
        viewController?.displayUserData(viewModel: viewModel)
    }
}

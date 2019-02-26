//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//


protocol LoginPresentationLogic
{
    func presentFetchUser(response: FetchUsers.FetchUsers.Response)
    func presentFetchUserError(response: String)
}

class LoginPresenter : LoginPresentationLogic {
    
    
    
    weak var viewController: LoginDisplayLogic?
    
    func presentFetchUser(response: FetchUsers.FetchUsers.Response) {
        let viewModel = FetchUsers.FetchUsers.ViewModel(user: response.user, error: nil)
        viewController?.displayUserLogged(viewModel: viewModel)
    }
    func presentFetchUserError(response: String) {
        let viewModel = FetchUsers.FetchUsers.ViewModel(user: nil, error: response)
        viewController?.displayFetchUserError(viewModel: viewModel)
    }
    
    
}

//
//  LoginPresenter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginPresentationLogic: class {
    func presentLoginResponse(response: Login.Login.Response)
    func showLastLoggedUser(response: Login.FetchLastLoggedUser.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: DisplayLoginLogic!
    
    func presentLoginResponse(response: Login.Login.Response) {        
        let viewModel = Login.Login.ViewModel(user: response.user, error: response.error)                
        
        viewController.displayLoginSuccessful(viewModel: viewModel)
    }
    
    func showLastLoggedUser(response: Login.FetchLastLoggedUser.Response) {        
        let viewModel = Login.FetchLastLoggedUser.ViewModel(username: response.username)
        
        viewController.setUsernameText(with: viewModel)
    }
}

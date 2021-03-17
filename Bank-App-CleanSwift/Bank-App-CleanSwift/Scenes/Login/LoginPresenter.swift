//
//  LoginPresenter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginPresentationLogic: class {
    func presentLoginResponse(response: Login.Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: DisplayLoginLogic!
    
    func presentLoginResponse(response: Login.Login.Response) {        
        let viewModel = Login.Login.ViewModel(user: response.user, error: response.error)                
        
        viewController.displayLoginSuccessful(viewModel: viewModel)
    }    
}

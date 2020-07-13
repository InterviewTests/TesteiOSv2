//
//  LoginPresenter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func presentLoginError(error: Error)
    func presentAccountDetails(response: Login.Fetch.Response)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
  
    // MARK: Do something
    
    func presentLoginError(error: Error) {
        viewController?.displayErrorMessage(error.localizedDescription)
    }
    
    func presentAccountDetails(response: Login.Fetch.Response) {
        viewController?.showAccountDetails()
    }
}

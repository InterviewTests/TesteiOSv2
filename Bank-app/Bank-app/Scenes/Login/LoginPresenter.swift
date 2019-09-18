//
//  LoginPresenter.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func presentStatementScreen(data: UserAccount)
}

class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: Properties
    var viewController: LoginViewControllerProtocol?
    
    // MARK: Implementation
    func presentStatementScreen(data: UserAccount) {
        viewController?.displayStatementScreen(with: data)
    }
}

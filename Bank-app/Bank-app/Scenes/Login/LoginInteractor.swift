//
//  LoginInteractor.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
    func performUserLogin(with data: LoginModel.loginInfo)
}

class LoginInteractor: LoginInteractorProtocol {
    
    // MARK: Properties
    var presenter: LoginPresenterProtocol?
    var repository: LoginRepositoryProtocol = LoginRepository()
    
    // MARK: Implementation
    func performUserLogin(with data: LoginModel.loginInfo) {
        
        repository.fetchUserInfo(with: data, success: { response in
            //
        }, failure: {
            //
        })
        
    }
}

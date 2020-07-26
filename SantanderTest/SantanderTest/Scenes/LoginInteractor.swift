//
//  LoginInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func login(with user: String?, and password: String?)
}

protocol LoginDataSource {
    var loginVM: Login.ViewModel? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataSource {
    
    var loginVM: Login.ViewModel?
    var userID: Int?
    
    var presenter: LoginPresentationLogic?
    var worker: LoginNetworkLogic
    
    init(with worker: LoginNetworkLogic = LoginWorker()) {
        self.worker = worker
    }
    
    //MARK: -
    //MARK: - PERFORM LOGIN
    func login(with user: String?, and password: String?) {
        if let user = user, !user.isEmpty, let pwd = password, !pwd.isEmpty  {
            if pwd.isValidPassword {
                presenter?.shouldPresentLoading(true)
                let request = Login.Request(user: user, password: pwd)
                worker.performLogin(with: request).done(handleSuccess).catch(handleError)
            } else {
                presentError(with: Strings.Error.invalidPassword)
            }
        } else {
            presentError(with: Strings.Error.emptyFields)
        }
    }
    
    //MARK: -
    //MARK: - HANDLE SUCCESS
    func handleSuccess(response: Login.Response) {
        presenter?.shouldPresentLoading(false)
        if let error = response.error?.message {
            presentError(with: error)
        } else {
            loginVM = Login.ViewModel(user: response.userAccount)
            presenter?.onSuccess()
        }
    }
    
    //MARK: -
    //MARK: - HANDLE ERROR
    func handleError(error: Error) {
        presentError(with: error.localizedDescription)
    }
    
    //MARK: -
    //MARK: - SETUP PRESENT ERROR
    func presentError(with message: String) {
        presenter?.shouldPresentLoading(false)
        presenter?.onError(title: Strings.Error.alertTitle, message: message)
    }
}

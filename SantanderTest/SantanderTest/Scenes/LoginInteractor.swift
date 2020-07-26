//
//  LoginInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

protocol LoginBusinessLogic {
    func login(with user: String?, and password: String?)
    func checkForSavedUser()
}

protocol LoginDataSource {
    var loginVM: Login.ViewModel? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataSource {
    
    var loginVM: Login.ViewModel?
    var userID: Int?
    
    var presenter: LoginPresentationLogic?
    var worker: LoginNetworkLogic
    
    var userReceived: String?
    var passwordReceived: String?
    
    init(with worker: LoginNetworkLogic = LoginWorker()) {
        self.worker = worker
    }
    
    //MARK: -
    //MARK: - PERFORM LOGIN
    func login(with user: String?, and password: String?) {
        if let user = user, !user.isEmpty, let pwd = password, !pwd.isEmpty  {
            if pwd.isValidPassword {
                userReceived = user
                passwordReceived = pwd
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
            if let user = userReceived, let pwd = passwordReceived {
                KeychainWrapper.standard.set(user, forKey: Constants.KeychainKeys.user)
                KeychainWrapper.standard.set(pwd, forKey: Constants.KeychainKeys.password)
            }
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
    
    //MARK: -
    //MARK: - CHECK USER
    func checkForSavedUser() {
        guard let retrivedUser = KeychainWrapper.standard.string(forKey: Constants.KeychainKeys.user),
            let retrivedPassword = KeychainWrapper.standard.string(forKey: Constants.KeychainKeys.password) else { return }
        presenter?.shouldPresentSaved(user: retrivedUser, and: retrivedPassword)
    }
}

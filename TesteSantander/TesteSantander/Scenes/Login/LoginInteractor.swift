//
//  LoginInteractor.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func performLogin(request: LoginModel.Login.Request)
    func getLastUserName()
}

protocol LoginDataStore {
    var userAccount: UserAccount? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var userAccount: UserAccount?
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    func performLogin(request: LoginModel.Login.Request) {
        worker = LoginWorker()
        
        guard let userIsValid = worker?.validateUserName(username: request.user ?? ""),
            let passwordIsValid = worker?.validatePassword(password: request.password ?? "") else { return }
        
        if userIsValid && passwordIsValid {
            worker?.login(requestData: request, completionSuccess: { (response) in
                self.userAccount = response.user?.userAccount
                self.saveLastUsername(username: request.user ?? "")
                DispatchQueue.main.async {
                    self.presenter?.presentLogin(response: response)
                }
            }, completionFailure: { (error) in
                DispatchQueue.main.async {
                    self.presenter?.presentLoginError(error: error)
                }
            })
        } else {
            DispatchQueue.main.async {
                self.presenter?.presentLoginError(error: "usuário ou senha inválida")
            }
        }
    }
    
    func getLastUserName() {
        guard let username = UserDefaults.standard.string(forKey: Constants.Identifiers.lastUsername) else { return }
        self.presenter?.getLastUsername(username: username)
    }
    
    func saveLastUsername(username: String) {
        UserDefaults.standard.set(username, forKey: Constants.Identifiers.lastUsername)
    }
}

//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

protocol LoginBusinessLogic {
    func getSavedUserName()
    func postLogin(request: LoginModel.Login.Request)
}

protocol LoginDataStore {
    var userAccount: AccountDetail? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var userAccount: AccountDetail?
    var worker: LoginWorker?
    
    func getSavedUserName() {
        guard let userName = UserDefaults.standard.string(forKey: Constants.Identifiers.userNameSaved) else { return }
        self.presenter?.getSavedUserName(userName: userName)
    }
    
    func postLogin(request: LoginModel.Login.Request) {
        if worker == nil {
            worker = LoginWorker()
        }
        
        guard let isValidPassword = worker?.validatePassword(password: request.password ?? ""),
            let isValidUser = worker?.validateUserId(userId: request.userId ?? "") else { return }
        
        if isValidPassword && isValidUser {
            worker?.login(requestData: request, completionSuccess: { (response) in
                self.saveUserName(username: request.userId ?? "")
                self.userAccount = response.user?.userAccount
                DispatchQueue.main.async {
                    self.presenter?.presentLogin(response: response)
                }
            }, completionFailure: { (error) in
                DispatchQueue.main.async {
                    self.presenter?.showAlertError(error: error)
                }
            })
        }else {
            DispatchQueue.main.async {
                self.presenter?.showAlertError(error: Constants.Messages.invalidLogin)
            }
        }
    }
    
    private func saveUserName(username: String) {
        UserDefaults.standard.set(username, forKey: Constants.Identifiers.userNameSaved)
    }
}

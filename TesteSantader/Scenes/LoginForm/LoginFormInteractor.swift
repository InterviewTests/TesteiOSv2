//
//  LoginFormInteractor.swift
//  TesteSantader
//
//  Created by Bruno Chen on 05/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol LoginFormBusinessLogic {
    func login(request: LoginForm.Login.Request)
    func verifyExistentUser()
}

protocol LoginFormDataStore {
    var user: UserData? { get }
}

class LoginFormInteractor: LoginFormBusinessLogic, LoginFormDataStore {
    
    var user: UserData?
    private var logged: Bool!

    var presenter: LoginFormPresentationLogic?
    var valitationWorker: valitationInputsWorkerProtocol?
    var bankApiWorker: BankAPIWorkerProtocol?
    var userKeychainWorker: KeychainWorkerProtocol?
    
    // MARK: - Existed User
    
    func verifyExistentUser() {
        userKeychainWorker = userKeychainWorker ?? UserKeychainWorker()
        presenter?.showExistentUser(userID: userKeychainWorker?.getData().userID ?? "", password: userKeychainWorker?.getData().password ?? "")
    }
    
    // MARK: - Login
    
    func login(request: LoginForm.Login.Request) {
        
        let userIDEmail = request.userID
        let password = request.password
        
        if ValitationUserIDPassword(userStr: userIDEmail, passwordStr: password) {

            authenticationUser(userIDEmail, password)

        } else {
            
            presenter?.presentLogin(response: LoginForm.Login.Response(success: false))
        }
        
    }
    
    // MARK: - Valitate User Inputs (UserId, Password)
    
    func ValitationUserIDPassword (userStr: String!, passwordStr: String!) -> Bool {
        
        valitationWorker = valitationWorker ?? ValitationInputsWorker()
        
        return valitationWorker!.isValidImputs(userStr: userStr, passwordStr: passwordStr)
    }
    
    // MARK: - Authentication User
    
    func authenticationUser(_ userIDEmail: String?, _ password: String?) {
        
        bankApiWorker = bankApiWorker ?? BankAPIWorker()
        
        bankApiWorker!.fetchUser(userID: userIDEmail!, password: password!) { (userData) in
            
            if let user = userData {
                self.user = user
                self.logged = true
                let response = LoginForm.Login.Response(success: true)
                self.presenter?.presentLogin(response: response)
            } else {
                self.logged = false
                let response = LoginForm.Login.Response(success: false)
                self.presenter?.presentLogin(response: response)
            }
        }
    }
}

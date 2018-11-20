//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func perfomLogin(request: Login.Request)
}
protocol LoginDataStore {
    var user: User? { get set }
}
class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var user: User?
    
    // MARK: Perform login
    
    func perfomLogin(request: Login.Request) {
        guard let userName = request.userName, !userName.isEmpty else {
            self.displayResponseError(message:"Please, insert a user name")
            return
        }
        
        guard let password = request.password, !password.isEmpty else {
            self.displayResponseError(message:"Please, insert a password")
            return
        }
        
        guard (userName.isValidEmail || userName.isValidCPF) else {
            self.displayResponseError(message:"The user name must be an email or valid cpf")
            return
        }
        
        if  password.isPasswordValid(){
            self.displayResponseError(message:"Password should contain a capital letter, number and special character.")
            return
        }
        self.requestLogin(user:userName, pass: password)
        
    }
    
    
    func displayResponseError(message:String){
        let response = Login.Response(isError: true, message:message, user: nil)
        presenter?.presentLoginErrorMessage(response: response)
    }
    
    
    func requestLogin(user:String,pass:String) {
        LoginWorker.authLogin(user: user, pass: pass) { (user,msgErro) in
            if let messsage = msgErro {
                self.displayResponseError(message:messsage)
            } else {
                if let user = user {
                    let response = Login.Response(isError: false, message:nil, user: user)
                    self.presenter?.presentLoginSuccesfull(response:response)
                }
            }
        }
        
    }
    
    
}

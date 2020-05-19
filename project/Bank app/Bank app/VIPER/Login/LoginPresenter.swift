//
//  LoginPresenter.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: AnyObject {
    var viewModel: LoginViewModel? { get set }
    func performLogin()
    func cleanup()
}

final class LoginPresenter: BasePresenter<LoginView, LoginRouterProtocol, LoginInteractorProtocol>, LoginPresenterProtocol {
    var viewModel: LoginViewModel?
    
    func performLogin(){
        
        //Base textfield validations
        if self.view?.usernameTextfield.text == nil || self.view?.usernameTextfield?.text?.isEmpty == true{
           self.view?.usernameTextfield.setState(state: false)
        }else{
             self.view?.usernameTextfield.setState(state: true)
        }
        
        if self.view?.passwordTextfield.text == nil || self.view?.passwordTextfield?.text?.isEmpty == true{
           self.view?.passwordTextfield.setState(state: false)
        }else{
             self.view?.passwordTextfield.setState(state: true)
        }
        
        //Interactor call
        if let username =  self.view?.usernameTextfield.text, let password =  self.view?.passwordTextfield.text {
            self.view?.showLoader()
            self.interactor?.performLogin(username: username, password: password, completion: {(loginInteractorModel : LoginInteractorModel?, _ error: LoginInteractorError?) -> Void in
                if let error = error {
                    switch error {
                    case .noValidPasswordError:
                        DispatchQueue.main.async {
                            self.view?.hideLoader()
                            self.view?.passwordTextfield.setState(state: false)
                        }
                        break
                    case .customServerError(let message):
                        DispatchQueue.main.async {
                            self.view?.hideLoader()
                            self.view?.handleError(message: message)
                        }
                        break
                    default:
                        DispatchQueue.main.async {
                            "Found error \(error)".errorLog()
                            self.view?.hideLoader()
                            self.view?.handleDefaultError()
                        }
                        break
                    }
                    return
                }
                if let user = loginInteractorModel{
                    DispatchQueue.main.async {
                        self.view?.hideLoader()
                        self.router?.presentDetailView()
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    "error and user are nil".errorLog()
                    self.view?.hideLoader()
                    self.view?.handleDefaultError()
                }
            })
        }
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}

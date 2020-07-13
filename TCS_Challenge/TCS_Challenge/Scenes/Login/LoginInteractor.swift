//
//  LoginInteractor.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func fetchLogin(_ request: Login.Fetch.Request)
}

protocol LoginDataStore {
    var loginResponse: Login.Fetch.Response? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    var loginResponse: Login.Fetch.Response?
    
    // MARK: - LoginBusinessLogic
    func fetchLogin(_ request: Login.Fetch.Request) {
        worker = LoginWorker()
        worker?.performLogin(request: request, completion: { (response) in
            switch response{
            case .success(let response):
                self.loginResponse = response
                self.presenter?.presentAccountDetails(response: response)
                break
            case .error(let error):
                self.presenter?.presentLoginError(error: error)
                break
            case .nonSpecifiedError:
                break
            }
        })
    }
    
//    func doSomething(request: ___VARIABLE_sceneName___.Something.Request)
//    {
//      worker = ___VARIABLE_sceneName___Worker()
//      worker?.doSomeWork()
//
//      let response = ___VARIABLE_sceneName___.Something.Response()
//      presenter?.presentSomething(response: response)
//    }
}

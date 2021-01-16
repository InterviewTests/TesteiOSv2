//
//  LoginInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginInteractor {
    
    var presenter: LoginPresenterProtocol?
    
    
    func validateLogin(_ loginForm: LoginFormProtocol, completion: (LoginForm) -> Void, fail: (String) -> Void) {
        // TODO: validate username
        
        // TODO: validate password
        
        // TODO: show answer
        // sucesso
        //completion(LoginForm(username: <#T##String#>, password: <#T##String#>))
        // fail
        fail("falhou validação")
    }
    
    func requestLogin(_ loginForm: LoginForm ) {
        // TODO: startRequest
        presenter?.startRequest()
        
        // TODO: make request
        
        
        // TODO: finish request
        presenter?.finishRequest()
        
        // TODO: show answer
        // sucesso:
        //presenter?.didLoginWithSuccess()
        // Salvar localmente
        
        // fail
        presenter?.loginDidFail("falhou login")
    }
    
}


// MARK: - Access from View

extension LoginInteractor: LoginInteractorProtocol {
    func login(_ loginForm: LoginFormProtocol) {
        validateLogin(loginForm) { loginForm in
            self.requestLogin(loginForm)
        } fail: { errorMessage in
            self.presenter?.didFailToValidate(errorMessage)
        }
    }
}

//
//  LoginInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import UIKit

protocol LoginInteractorProtocol: AnyObject {
    func viewWillAppear()
    func login(_ loginForm: LoginFormProtocol)
}


class LoginInteractor {
    
    var presenter: LoginPresenterProtocol?
    
    enum LoginError: Error {
        case blankUsername
        case blankPassword
        case invalidUsername
        case invalidPassword(message: String)
    }
    
    
    func validate(_ loginForm: LoginFormProtocol, completion: (LoginForm) -> Void, fail: (_ message: String) -> Void) {
        let username = (loginForm.username ?? "").trimmingCharacters(in: .whitespaces)
        let password = loginForm.password ?? ""
        
        do {
            try validateUsername(username)
            try validatePassword(password)
            
            completion(LoginForm(username: username, password: password))
        }
        catch LoginError.blankUsername { fail("Username não informado") }
        catch LoginError.invalidUsername { fail("Username inválido.\nUsername deve ser um e-mail ou número de cpf") }
        catch LoginError.blankPassword { fail("Senha não informada") }
        catch LoginError.invalidPassword(let message) { fail(message) }
        catch { fail("Falha ao tentar logar") }
    }
    
    func validateUsername(_ username: String) throws {
        if InputValidator.validateCPF(username) != nil { return }
        else {
            do {
                try InputValidator.validateEmail(username)
            }
            catch InputValidator.ValidationError.blankEmail { throw LoginError.blankUsername }
            catch InputValidator.ValidationError.invalidEmail { throw LoginError.invalidUsername }
            catch { throw error }
        }
    }
    
    func validatePassword(_ password: String) throws {
        do {
            try InputValidator.validatePassword(password)
        }
        catch InputValidator.ValidationError.blankPassword { throw LoginError.blankPassword }
        catch InputValidator.ValidationError.invalidPassword(let message) { throw LoginError.invalidPassword(message: message) }
        catch { throw error }
        
        
        if password.isEmpty { throw LoginError.blankPassword }
    }
    
    func requestLogin(_ loginForm: LoginForm ) {
        presenter?.startRequest()
        LoginRequester.postLogin(loginForm) { responseObject in
            self.presenter?.finishRequest()
            
            User.shared.login(responseObject.userAccount)
            self.saveLoginLocally(loginForm)
            
            self.presenter?.didLoginWithSuccess()
        } fail: { errorMessage in
            self.presenter?.finishRequest()
            self.presenter?.loginDidFail(errorMessage)
        }
    }
    
    func findLoginSavedLocally() -> Bool {
        
        guard let fetchedObjects = LoginInfoLocalEntity.fetchAll() else { return false }
        
        return fetchedObjects.count > 0
    }
    
    func saveLoginLocally(_ loginInfo: LoginForm) {
        let manageContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newLocalExample = LoginInfoLocalEntity(context: manageContext)
        newLocalExample.username = loginInfo.username
        newLocalExample.password = loginInfo.password
        newLocalExample.save()
    }
    
}

extension LoginInteractor: LoginInteractorProtocol {
    func viewWillAppear() {
         presenter?.hasLoginSaved(findLoginSavedLocally())
    }
    
    func login(_ loginForm: LoginFormProtocol) {
        
        validate(loginForm) { loginForm in
            self.requestLogin(loginForm)
        } fail: { errorMessage in
            self.presenter?.didFailToValidate(errorMessage)
        }

    }
}

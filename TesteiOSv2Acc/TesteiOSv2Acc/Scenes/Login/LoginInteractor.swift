//
//  LoginInteractor.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol LoginBusinessLogic
{
    func doLogin(request: Login.LoginUser.Request)
    func loadLoginDataIfExists(request: Login.LoadLoginData.Request)
}

protocol LoginDataStore
{
    var userAccount: UserAccount? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    var userAccount: UserAccount?
    
    // MARK: Presenter communication
    
    func doLogin(request: Login.LoginUser.Request)
    {
        let user = request.user
        let password = request.password
        
        let inputValidationResult = isUserAndPasswordValid(user: user, password: password)
        
        if (inputValidationResult.isValid){
            worker = LoginWorker()
            worker?.doLoginRequest(user: user, password: password)
            { userAccount, serviceError in
                
                let response = Login.LoginUser.Response(userAccount: userAccount, serviceError: serviceError)
                
                self.presenter?.presentLoginUser(response: response)
            }
        }else{
            let response = Login.LoginUser.Response(userAccount: nil, serviceError: inputValidationResult.serviceError)
            presenter?.presentLoginUser(response: response)
        }
    }
    
    func loadLoginDataIfExists(request: Login.LoadLoginData.Request)
    {
        worker = LoginWorker()
        let user = worker?.retrieveUserFromKeychain()
        let response = Login.LoadLoginData.Response(user: user, isError: false)
        presenter?.presentLoadLoginData(response: response)
    }
    
    //MARK: - Validation methods
    
    private func isUserAndPasswordValid(user: String, password: String) -> InputValidationResult
    {
        let userValidationResult = isUserValid(user: user)
        let passwordValidationResult = isPasswordValid(password: password)
        
        if !userValidationResult.isValid{
            return userValidationResult
        }else if !passwordValidationResult.isValid{
            return passwordValidationResult
        }
        
        return InputValidationResult(isValid: true, serviceError: nil)
    }
    
    private func isUserValid(user: String) -> InputValidationResult
    {
        if user.isEmpty{
            return InputValidationResult(isValid: false, serviceError: ServiceError(code: -1, message: "Preencha o campo usuário"))
        }
        
        //TODO: User validation
        return InputValidationResult(isValid: false, serviceError: ServiceError(code: -1, message: "User not validated"))
    }
    
    private func isPasswordValid(password: String) -> InputValidationResult
    {
        
        if password.isEmpty{
            return InputValidationResult(isValid: false, serviceError: ServiceError(code: -1, message: "Preencha o campo senha"))
        }
        
        //TODO: Password validation
        return InputValidationResult(isValid: false, serviceError: ServiceError(code: -1, message: "Password not validated"))
    }
    
}

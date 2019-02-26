//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import Foundation

protocol LoginBusinessLogic {
    func login(request: FetchUsers.FetchUsers.Request)
}

protocol LoginDataStore
{
    var user: User! { get set }
}
class LoginInteractor : LoginBusinessLogic , LoginDataStore{
    var user: User!
    
    var presenter: LoginPresentationLogic?
    var worker : BankProtocol?
    
    func login(request: FetchUsers.FetchUsers.Request) {
        self.requestUser(userFields: request.userFormFields)
    }
 
    private func requestUser(userFields: FetchUsers.UserFormFields) { //-> User {
        worker?.requestUser(userFields, completionHandler: { (user, error) in
            if let user = user {
                self.user = user
                self.presenter?.presentFetchUser(response: FetchUsers.FetchUsers.Response(user: self.user))
            }else{
                self.presenter?.presentFetchUserError(response: error
                    ?? "Não foi possivel obter dados do login")
            }
        })
    }
    
}

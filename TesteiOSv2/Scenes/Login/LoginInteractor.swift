//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import UIKit
import Foundation
import CoreData

protocol LoginBusinessLogic {
    func login(request: FetchUsers.FetchUsers.Request)
    func lastLogin() -> String?
}

protocol LoginDataStore
{
    var user: User! { get set }
}
class LoginInteractor : LoginBusinessLogic , LoginDataStore{
    func lastLogin() -> String? {
        return self.fetchLastUserLogged()
    }
    
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
                self.saveUser(userFields.user)
                self.presenter?.presentFetchUser(response: FetchUsers.FetchUsers.Response(user: self.user))
            }else{
                self.presenter?.presentFetchUserError(response: error
                    ?? "Não foi possivel obter dados do login")
            }
        })
    }
    
    private func saveUser(_ login : String){
        BankDAO.save(login)
    }
    
    private func fetchLastUserLogged() -> String? {
        return BankDAO.get()
    }
}

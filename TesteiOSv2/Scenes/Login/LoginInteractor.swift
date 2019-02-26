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
 
    private func requestUser(userFields: FetchUsers.UserFormFields) {
        if validPassword(userFields.password) {
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
    }
    private func validPassword(_ password:String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: password)
        if !capitalresult{
            presenter?.presentFetchUserError(response: "Senha invalida!\nSenha deve conter ao menos 1 letra maiúscula.")
            return false
        }
        
        
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: password)
        if !numberresult{
            presenter?.presentFetchUserError(response: "Senha invalida!\nSenha deve conter ao menos 1 número.")
            return false
        }
        
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        
        let specialresult = texttest2.evaluate(with: password)
        if !specialresult{
            presenter?.presentFetchUserError(response: "Senha invalida!\nSenha deve conter ao menos 1 caracter especial.")
            return false
        }
        return true
    }
    private func saveUser(_ login : String){
        BankDAO.save(login)
    }
    
    private func fetchLastUserLogged() -> String? {
        return BankDAO.get()
    }
}

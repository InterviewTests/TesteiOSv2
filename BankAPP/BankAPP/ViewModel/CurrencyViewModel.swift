//
//  CurrencyViewModel.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 11/07/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

class CurrencyViewModel {
    
    let apiManager: ApiManagerDelegate
    var userAccount = [DataUser]()
    var statementUser = [StatementUser]()
    var statementList = [StatementList]()
    var isError = false

    init(apiManager: ApiManagerDelegate) {
        self.apiManager = apiManager
    }
    
    func loadLogin(completion: @escaping (ValidationError?) -> Void) {
        
        apiManager.getLoginSerealization { [weak self] (login, error) in
            guard let self = self, let logins = login else {
                completion(error)
                return
            }
            if error == nil {
                self.userAccount = logins
                completion(nil)
                return
            }
            completion(error)
            return
        }
    }
    
    func loadStatement(completion: @escaping (ValidationError?) -> Void) {
        apiManager.getStatementSerealization { [weak self] (statementList, error) in
            guard let self = self, let statementUser = statementList else {
                completion(error)
                return
            }
            if error == nil {
                self.statementUser = statementUser
                completion(nil)
                return
            }
            completion(error)
            return
        }
    }
    //TODO: - passar erro para viewController correta
    private func getStatements() {
        loadStatement { [weak self] (error) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                if error == nil {
                    self.isError = false
                }else{
                    self.isError = true
                }
            }
        }
    }
    
    
    func checkIsValidEmail(email: String) -> (Bool, DataUser) {
        getStatements()
        
        var isValid: Bool = false
        var user = [DataUser]()
        var dataUser: DataUser?
        
        let userEmail = userAccount.filter({$0.email == email})
        if userEmail.count > 0 {
            isValid = true
            user = userEmail
            
//            for userId in user {
//                 userid = userId.userId
//            }

            for info in userEmail {
                dataUser = DataUser(userId: info.userId, email: info.email, cpf: info.cpf, name: info.name, bankAccount: info.bankAccount, agency: info.agency, balance: info.balance)
                self.statementList = loadStatementListFromUser(userId: dataUser?.userId ?? 0)
            }
            
            //self.statementList = loadStatementListFromUser(userId: userid ?? 0)
            
          self.saveLastUserLogged(userLogged: user)
            
        }else{
            isValid = false
            user = []
        }
        
        guard let data = dataUser else {return (false, DataUser(userId: 0, email: "", cpf: "", name: "", bankAccount: "", agency: "", balance: 0.0)) }
        
        return (isValid, data)
    }
    
    func saveLastUserLogged(userLogged: [DataUser]) {
        let defaults = UserDefaults.standard
        
        for email in userLogged{
            defaults.set(email.email, forKey: "SaveEmail")
        }
        
        
    }
    
    func loadStatementListFromUser(userId: Int) -> [StatementList] {
        var statementList = [StatementList]()
        for user in statementUser {
            if user.userId == userId {
                statementList = user.statementList
            }
        }
        return statementList
    }
}

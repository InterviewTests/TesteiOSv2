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
    var loginName: String?
    
    init(apiManager: ApiManagerDelegate) {
        self.apiManager = apiManager
    }
    
    func loadLogin(completion: @escaping (ValidationError?) -> Void) {
        
        apiManager.getLoginSerealization { [weak self] (login, erro) in
            guard let self = self else {return}
            if erro == nil {
                self.loginName = login?.userAccount.name
                completion(nil)
                return
            }
            completion(erro)
            return
        }
        
    }
    
    
    
}

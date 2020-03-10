//
//  UserWorker.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class UserWorker {
    
    var userStore: UserStoreProtocol
    
    init(store: UserStoreProtocol) {
        self.userStore = store
    }
    
    func doLogin(user: String, password: String) {
        userStore.doLogin(user: user, password: password, completionHandler: { _ in
            
        })
    }
    
}

protocol UserStoreProtocol {
    
    func doLogin(user: String, password: String, completionHandler: @escaping (LoginResponse) -> ())
    
}

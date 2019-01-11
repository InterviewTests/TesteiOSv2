//
//  UsersWorker.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import Foundation

class UsersWorker {
    var usersStore: UsersStoreProtocol
    
    init(usersStore: UsersStoreProtocol) {
        self.usersStore = usersStore
    }
    
    func loginUser(user: String, password: String, completionHandler: @escaping (User?) -> Void) {
        self.usersStore.loginUser(user: user, password: password) { (user: User?) -> Void in
            DispatchQueue.main.async {
                completionHandler(user)
            }
        }
    }
}

protocol UsersStoreProtocol {
    func loginUser(user: String, password: String, completionHandler: @escaping (User?) -> Void)
}

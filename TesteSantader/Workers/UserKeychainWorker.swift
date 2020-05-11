//
//  UserWorker.swift
//  TesteSantader
//
//  Created by Bruno Chen on 08/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol KeychainWorkerProtocol {
    func saveData(userID: String, password: String)
    func getData() -> (userID: String?, password: String?)
    func removeData()
}

class UserKeychainWorker: KeychainWorkerProtocol {
    
    var userKeychainService: KeychainServiceProtocol?
    
    func saveData(userID: String, password: String) {
        userKeychainService = userKeychainService ?? UserKeychainService()
        userKeychainService?.saveUserPassword(userID: userID, password: password)
    }
    
    func getData() -> (userID: String?, password: String?) {
        userKeychainService = userKeychainService ?? UserKeychainService()
        return userKeychainService!.getUserPassword()
    }
    
    func removeData() {
        userKeychainService!.removeUserPassword()
    }
    
}

